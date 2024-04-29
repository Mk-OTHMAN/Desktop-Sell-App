import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_state.dart';
import 'package:home_tools/models/product.dart';
import 'package:home_tools/routes/routes_name.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  TextEditingController productNamecontroller = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  TextEditingController mainPriceController = TextEditingController();
  TextEditingController customerPriceController = TextEditingController();
  Box productBox = Hive.box<Product>('products');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //* _________________________________________________________________
  Future<void> addProduct() async {
    Box productBox = Hive.box<Product>('products');
    await productBox.addAll(<Product>[
      Product(
        name: productNamecontroller.text,
        quantity: productQuantityController.text,
        mainPrice: mainPriceController.text,
        customerPrice: customerPriceController.text,
      )
    ]);

    productNamecontroller.clear();
    productQuantityController.clear();
    mainPriceController.clear();
    customerPriceController.clear();

    emit(AddProductInitial());
  }

//* _________________________________________________________________
  void dleteProduct(int index) {
    productBox.deleteAt(index);
    emit(AddProductInitial());
  }

//* _________________________________________________________________
  Future<void> editProductName(int index) async {
    Box productBox = Hive.box<Product>('products');
    productBox.putAt(
        index,
        Product(
            name: productNamecontroller.text,
            customerPrice: productBox.getAt(index).customerPrice,
            mainPrice: productBox.getAt(index).mainPrice,
            quantity: productBox.getAt(index).quantity));

    productNamecontroller.clear();
    emit(AddProductInitial());
  }

//* _________________________________________________________________
  Future<void> editProductStock(int index) async {
    Box productBox = Hive.box<Product>('products');
    productBox.putAt(
        index,
        Product(
            name: productBox.getAt(index).name,
            customerPrice: productBox.getAt(index).customerPrice,
            mainPrice: productBox.getAt(index).mainPrice,
            quantity: addToStock(index).toString()));

    productQuantityController.clear();
    emit(AddProductInitial());
  }

//* _________________________________________________________________
  Future<void> editProductMainPrice(int index) async {
    Box productBox = Hive.box<Product>('products');
    productBox.putAt(
        index,
        Product(
            name: productBox.getAt(index).name,
            customerPrice: productBox.getAt(index).customerPrice,
            mainPrice: mainPriceController.text,
            quantity: productBox.getAt(index).quantity));

    mainPriceController.clear();
    emit(AddProductInitial());
  }

//* _________________________________________________________________
  Future<void> editProductCustomerPrice(int index) async {
    Box productBox = Hive.box<Product>('products');
    productBox.putAt(
        index,
        Product(
            name: productBox.getAt(index).name,
            customerPrice: customerPriceController.text,
            mainPrice: productBox.getAt(index).mainPrice,
            quantity: productBox.getAt(index).quantity));

    customerPriceController.clear();
    emit(AddProductInitial());
  }

//* _________________________________________________________________
  int addToStock(int index) {
    int oldStock = int.parse(productBox.getAt(index).quantity);
    int newStock = int.parse(productQuantityController.text);
    return oldStock + newStock;
  }

//* _________________________________________________________________
  void gifShowDialog(String gifPath, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: GiffyDialog.image(
            Image.asset(
              gifPath,
              height: 300.h,
              fit: BoxFit.cover,
            ),
            title: const Text(
              'Image Animation',
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'This is a image animation dialog box. This library helps you easily create fancy giffy dialog.',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, RoutesName.editProductScreen),
                child: const Text('OK'),
              ),
            ],
          ));
        });
    emit(AddProductInitial());
  }
}
