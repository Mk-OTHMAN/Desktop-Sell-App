import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_tools/bloc/product/add_product_cubit/add_product_state.dart';
import 'package:home_tools/copmonent/functions_wiget.dart';
import 'package:home_tools/models/product/product.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  //* _______________ Controllers ________________________
  TextEditingController productNamecontroller = TextEditingController();
  TextEditingController productStockController = TextEditingController();
  TextEditingController productMainPriceController = TextEditingController();
  TextEditingController productCustomerPriceController =
      TextEditingController();
  //* ____________ Hive Database _____________
  Box productBox = Hive.box<Product>('products');

  //* __________________________Add Product Function___________________________________________
  Future<void> addProduct(
    TextEditingController productNamecontroller,
    TextEditingController productStockController,
    TextEditingController mainPriceController,
    TextEditingController customerPriceController,
  ) async {
    Box productBox = Hive.box<Product>('products');
    await productBox.add(Product(
      name: productNamecontroller.text,
      quantity: productStockController.text,
      mainPrice: mainPriceController.text,
      customerPrice: customerPriceController.text,
    ));

    productNamecontroller.clear();
    productStockController.clear();
    mainPriceController.clear();
    customerPriceController.clear();

    emit(AddProductInitial());
  }

//* ___________________________Delete Product Function______________________________________
  Future<void> dleteProduct(int index) async {
    await productBox.delete(productBox.keyAt(index));
    await productBox.flush();
    emit(AddProductInitial());
  }

//* ____________________Edit Product Name Function_____________________________________________

  void editProductName(int index, List l1, List l2) {
    if (l1[index] == l2[index]
        // l1[productBox.keyAt(index)] == l2[productBox.keyAt(index)]
        ) {
      productBox.putAt(
          index,
          Product(
            name: productNamecontroller.text,
            customerPrice: productBox.getAt(index).customerPrice,
            mainPrice: productBox.getAt(index).mainPrice,
            quantity: productBox.getAt(index).quantity,
          ));
    } else {
      for (int i = 0; i < l1.length; i++) {
        if (l2[index].key == l1[i].key
            // l2[productBox.keyAt(index)] == l1[productBox.keyAt(i)]
            ) {
          productBox.putAt(
              i,
              Product(
                name: productNamecontroller.text,
                customerPrice: productBox.getAt(i).customerPrice,
                mainPrice: productBox.getAt(i).mainPrice,
                quantity: productBox.getAt(i).quantity,
              ));
        }
      }
    }

    productNamecontroller.clear();

    emit(AddProductInitial());
  }
//* ____________________Edit Stock Product Function_____________________________________________

  void editProductStock(int index, List l1, List l2) {
    int addToStock(int index) {
      int oldStock = int.parse(productBox.getAt(index).quantity);
      int newStock = int.parse(productStockController.text);
      return oldStock + newStock;
    }

    if (l1[index] == l2[index]) {
      productBox.putAt(
          index,
          Product(
            name: productBox.getAt(index).name,
            customerPrice: productBox.getAt(index).customerPrice,
            mainPrice: productBox.getAt(index).mainPrice,
            quantity: addToStock(index).toString(),
          ));
    } else {
      for (int i = 0; i < l1.length; i++) {
        if (l2[index].key == l1[i].key) {
          productBox.putAt(
              i,
              Product(
                name: productBox.getAt(i).name,
                customerPrice: productBox.getAt(i).customerPrice,
                mainPrice: productBox.getAt(i).mainPrice,
                quantity: addToStock(i).toString(),
              ));
        }
      }
    }

    productStockController.clear();

    emit(AddProductInitial());
  }
//* ___________________Edit Main Price Product Function______________________________________________

  void editProductMainPriceByIndex(int index, List l1, List l2) {
    if (l1[index] == l2[index]) {
      productBox.putAt(
          index,
          Product(
            name: productBox.getAt(index).name,
            customerPrice: productBox.getAt(index).customerPrice,
            mainPrice: productMainPriceController.text,
            quantity: productBox.getAt(index).quantity,
          ));
    } else {
      for (int i = 0; i < l1.length; i++) {
        if (l2[index].key == l1[i].key) {
          productBox.putAt(
              i,
              Product(
                name: productBox.getAt(i).name,
                customerPrice: productBox.getAt(i).customerPrice,
                mainPrice: productMainPriceController.text,
                quantity: productBox.getAt(i).quantity,
              ));
        }
      }
    }

    productMainPriceController.clear();

    emit(AddProductInitial());
  }

//* __________________Add Customer Price Product Function_______________________________________________

  void editProductCustomerPrice(int index, List l1, List l2) {
    if (l1[index] == l2[index]) {
      productBox.putAt(
          index,
          Product(
            name: productBox.getAt(index).name,
            customerPrice: productCustomerPriceController.text,
            mainPrice: productBox.getAt(index).mainPrice,
            quantity: productBox.getAt(index).quantity,
          ));
    } else {
      for (int i = 0; i < l1.length; i++) {
        if (l2[index].key == l1[i].key) {
          productBox.putAt(
              i,
              Product(
                name: productBox.getAt(i).name,
                customerPrice: productCustomerPriceController.text,
                mainPrice: productBox.getAt(i).mainPrice,
                quantity: productBox.getAt(i).quantity,
              ));
        }
      }
    }

    productCustomerPriceController.clear();

    emit(AddProductInitial());
  }

//* ________________Gif Alert Dialog Function_________________________________________________
  void gifAlertDialog(
    String gifPath,
    BuildContext context,
    String title,
    String content,
    VoidCallback onPressed,
  ) {
    CustomWidget.gifShowDialog(gifPath, context, title, content, onPressed);
    emit(AddProductInitial());
  }

  //* _________Function return List of products___________
  List<dynamic> getProductList() => productBox.values.toList();
}
