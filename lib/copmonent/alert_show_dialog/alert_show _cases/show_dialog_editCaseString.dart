import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_tools/bloc/product/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/product/search_product_cubit/search_cubit.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/alert_show_dialog/Edit_Alert/edit_alert_show.dart';

void showDialogForEditCaseTextFieldReciveStringOrNumber(
    {required BuildContext context,
    required GlobalKey<FormState> globalKeyState,
    required TextEditingController editFieldController,
    required String hintText,
    required String labelText,
    required String textUpTextField,
    required String routeNameAfterSuccessProcessDone,
    required String successProcessMessage,
    required VoidCallback functionForMakeProcess}) {
  final productCubit = BlocProvider.of<AddProductCubit>(context);
  final searchCubit = BlocProvider.of<ProductSearchCubit>(context);
  showDialog(
      context: context,
      builder: (context) => Form(
            key: globalKeyState,
            child: EditAlertStringOrNumber(
              editFieldController: editFieldController,
              hintText: hintText,
              labelText: labelText,
              textUpTextField: textUpTextField,
              height: 60,
              width: 15,
              onPressed: () {
                if (globalKeyState.currentState!.validate()) {
                  functionForMakeProcess();
                  productCubit.gifAlertDialog(
                    Constant.jobDoneGif,
                    context,
                    'SUCCESS',
                    successProcessMessage,
                    () {
                      Navigator.popAndPushNamed(
                          context, routeNameAfterSuccessProcessDone);
                      searchCubit.searchController.clear();
                      searchCubit.isSearch = false;
                    },
                  );
                }
              },
            ),
          ));
}
