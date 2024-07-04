import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_tools/bloc/corporate/corporate_cubit/corporate_state.dart';
import 'package:home_tools/models/corporate/corporate.dart';
import 'package:intl/intl.dart';

class CorporateCubit extends Cubit<CorporateState> {
  CorporateCubit() : super(AddCorporateState());
  TextEditingController corporateNameController = TextEditingController();
  TextEditingController corporateAccountController = TextEditingController();
  TextEditingController corporatePaidAmountController = TextEditingController();
  TextEditingController corporateRemainingAmountController =
      TextEditingController();
  List paidList = [];
  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  Box corporateBox = Hive.box<Corporate>('corporate');
  Box payHistoryBox = Hive.box('payHistory');
  Future<void> addCorporateAccount(
    TextEditingController corporateNameController,
    TextEditingController corporateAccountController,
  ) async {
    await corporateBox.addAll(<Corporate>[
      Corporate(
        name: corporateNameController.text,
        forwardAmount: corporateAccountController.text,
        date: date,
      )
    ]);

    emit(AddCorporateState());
  }
  //* ---------- paid method ----------

  void paidMethod(int index, TextEditingController paidAmountController) {
    int amount = int.parse(paidAmountController.text);
    int paid = int.parse(corporateBox.getAt(index).paidAmount);
    int paidAmount = paid + amount;
    int currentRemainingAmoun = 0;
    int oldremainingAmount =
        int.parse(corporateBox.getAt(index).remainingAmount);
    int forwardAmount = int.parse(corporateBox.getAt(index).forwardAmount);
    if (oldremainingAmount == 0) {
      oldremainingAmount = forwardAmount;
      currentRemainingAmoun = oldremainingAmount - amount;
    } else {
      currentRemainingAmoun = oldremainingAmount - amount;
    }
    Map<String, dynamic> x = {'date': date, 'amount': amount};
    switch (paid) {
      case >= 0:
        corporateBox.putAt(
            index,
            Corporate(
                name: corporateBox.getAt(index).name,
                date: corporateBox.getAt(index).date,
                forwardAmount: corporateBox.getAt(index).forwardAmount,
                paidAmount: paidAmount.toString(),
                remainingAmount: currentRemainingAmoun.toString(),
                payHistory: [...corporateBox.getAt(index).payHistory, x]));
    }
    print(corporateBox.getAt(index).payHistory.toString());
    // print(corporateBox.getAt(index).payHistory.length.toString());

    // print(paidList);

    paidAmountController.clear();
    emit(AddCorporateState());
  }
}
