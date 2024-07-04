import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_tools/bloc/corporate/corporate_search/corporate_search_state.dart';
import 'package:home_tools/models/corporate/corporate.dart';

class CorporateSearchCubit extends Cubit<CorporateSearchState> {
  CorporateSearchCubit() : super(CorporateSearch());
  TextEditingController searchController = TextEditingController();
  TextEditingController corporatetNamecontroller = TextEditingController();

  bool isSearch = false;
  int index = 0;
  List searchList = [];
  //* ____ search text field widget ___
  Widget searchTextField() {
    return Row(
      children: [
        //* __ text field ___
        Container(
          color: Colors.white,
          width: 100.w,
          height: 50.h,
          child: TextField(
            controller: searchController,
            autofocus: true,
            textDirection: TextDirection.rtl,
            onChanged: (searchController) {
              searchResult(searchController);
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  isSearch = !isSearch;
                  searchController.clear();
                  emit(CorporateSearch());
                },
                icon: const Icon(Icons.clear),
                color: Colors.black,
                iconSize: 20,
              ),
              hintTextDirection: TextDirection.rtl,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                width: 5,
                color: Colors.white,
              )),
            ),
          ),
        ),
      ],
    );
  }

  //*_____ icon search widget ____
  Widget iconSearch() {
    return CircleAvatar(
      radius: 20,
      child: IconButton(
          onPressed: () {
            isSearch = !isSearch;
            searchController.clear();
            emit(CorporateSearch());
          },
          icon: const Icon(
            Icons.search,
            size: 23,
          )),
    );
  }

  //* Add Data int search list Function
  void searchResult(String searchText) {
    Box corporateBox = Hive.box<Corporate>('corporate');
    searchList = corporateBox.values
        .where((element) => element.name.toLowerCase().startsWith(searchText))
        .toList();
    emit(CorporateSearch());
  }
}
