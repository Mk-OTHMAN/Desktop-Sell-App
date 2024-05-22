import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/elevated_button.dart';
import 'package:home_tools/copmonent/functions_wiget.dart';
import 'package:home_tools/copmonent/alert_show_dialog/addProduct_alert.dart';
import 'package:home_tools/copmonent/text_button.dart';
import 'package:home_tools/routes/routes_name.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductCubit productCubit = BlocProvider.of<AddProductCubit>(context);
    return Scaffold(

        //* ______ body section  _____
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Constant.homeBackground), fit: BoxFit.fill),
            ),
            //* ____ column for some elevated button ____
            child: Column(
              children: [
                // some space height ___
                Functions.someSpaceHeight(5),
                //* ______ row for Appbar section _____
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //! add product text button
                    CustomTextButton(
                      textButtonName: '+ Add Product',
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) => AddAlertShowDialog(
                                productNameController:
                                    productCubit.productNamecontroller,
                                productStockController:
                                    productCubit.productStockController,
                                mainPriceController:
                                    productCubit.productMainPriceController,
                                customerPriceController:
                                    productCubit.productCustomerPriceController,
                              )),
                      buttonNameFontSize: 4,
                    ),
                    // !some space width ___
                    Functions.someSpaceWidth(1),
                    // !edit product text button
                    CustomTextButton(
                      textButtonName: '! Edit Product',
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, RoutesName.editProductScreen);
                      },
                      buttonNameFontSize: 4,
                    ),
                    // !some space width ___
                    Functions.someSpaceWidth(1),
                    // !delete product text button
                    CustomTextButton(
                      textButtonName: '- Delete Product',
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, RoutesName.deleteProductScreen);
                      },
                      buttonNameFontSize: 4,
                    ),
                    // !some space width ___
                    Functions.someSpaceWidth(1),
                    // !ِAdd corporate Account text button
                    CustomTextButton(
                      textButtonName: '+ Corporate Account',
                      onPressed: () {},
                      buttonNameFontSize: 4,
                    ),
                    // !some space width ___
                    Functions.someSpaceWidth(1),
                    // !Add Customer Account text button
                    CustomTextButton(
                      textButtonName: '+ Customer Account',
                      onPressed: () {},
                      buttonNameFontSize: 4,
                    ),
                  ],
                ),
                // !some space height ___
                Functions.someSpaceHeight(100),
                // //!column for some elevated button
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //             //! _____ product elevated button _____
                            CustomElevatedButton(
                              buttonName: 'Products',
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, RoutesName.productScreen),
                              buttonWidth: 70,
                              buttonHeight: 40,
                              buttonNameFontSize: 5,
                              color: Colors.orange,
                            ),
                            //             //! some space  ____________
                            Functions.someSpaceHeight(25),
                            // !____ stock elevated button ______
                            CustomElevatedButton(
                              buttonName: 'Stock',
                              onPressed: () {
                                Navigator.popAndPushNamed(
                                    context, RoutesName.stockScreen);
                              },
                              buttonWidth: 70,
                              buttonHeight: 40,
                              buttonNameFontSize: 5,
                            ),
                            //! some space height ___
                            Functions.someSpaceHeight(25),
                            //! ____ Corporate elevated button ______
                            CustomElevatedButton(
                              buttonName: 'Corporate Account',
                              onPressed: () => Navigator.popAndPushNamed(
                                  context, RoutesName.corporateAccountScreen),
                              buttonWidth: 70,
                              buttonHeight: 40,
                              buttonNameFontSize: 5,
                              color: Colors.red,
                            ),
                            //! some space height ___
                            Functions.someSpaceHeight(25),
                            //! ____ Custome Account elevated button ____
                            CustomElevatedButton(
                              buttonName: 'Customer Account',
                              onPressed: () => Navigator.popAndPushNamed(
                                  context, RoutesName.customeAccountScreen),
                              buttonWidth: 70,
                              buttonHeight: 40,
                              buttonNameFontSize: 5,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
