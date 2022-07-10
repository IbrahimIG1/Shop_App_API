import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_api_1/screens/businees.dart';
import 'package:flutter_application_api_1/screens/science.dart';
import 'package:flutter_application_api_1/screens/settingscreen.dart';
import 'package:flutter_application_api_1/screens/sportscreen.dart';
import 'package:flutter_application_api_1/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_state.dart';

class Cubity extends Cubit<CubityState> {
  Cubity() : super(CubityinitialState());

  static Cubity get(context) => BlocProvider.of(context);

  int indexNav = 0;

  void navChangeIcon(int index) {
    indexNav = index;
    if(index == 0) getBusiness();
    if(index == 1) getSport();
    if(index == 2) getSience();
    emit(NavChangeIconState());
  }

  
  List<BottomNavigationBarItem> navThemItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined),
      label: "Businees",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
  ];

  List<Widget> listScreens = const [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingScreen(),
  ];
  //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e9ad4525d14b4aada416770514075197

  List<dynamic> business = [];
  int selectedItem =0;
  bool? isDesktop; 
  void changeSelectedItem(int index)
  {
    selectedItem = index;
    emit(SelctedItemState());
  }
  void setDesktop(bool value)
  {
    isDesktop = value;
    emit(SetDesktopState());
  }
  void getBusiness() {
    emit(NewGetBusniessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(query: {
        "country": "eg",
        "category": "business",
        "apiKey": "e9ad4525d14b4aada416770514075197",
      }, url: 'v2/top-headlines')
          .then((value) {
        business = value.data["articles"];
        print("Getting Business Done");
        emit(NewGetBusniessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetBusniessErrorState(error));
      });
    } else {
      emit(NewGetBusniessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSport() {
    emit(NewGetSportLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(query: {
        "country": "eg",
        "category": "sport",
        "apiKey": "e9ad4525d14b4aada416770514075197",
      }, url: 'v2/top-headlines')
          .then((value) {
        sports = value.data["articles"];
        print("Getting Sport Done");
        emit(NewGetSportSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetSportErrorState(error));
      });
    } else {
      emit(NewGetSportSuccessState());
    }
  }

  List<dynamic> science = [];
  void getSience() {
    emit(NewGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(query: {
        "country": "eg",
        "category": "science",
        "apiKey": "e9ad4525d14b4aada416770514075197",
      }, url: 'v2/top-headlines')
          .then((value) {
        science = value.data["articles"];
        print("Getting Science Done");
        emit(NewGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetScienceErrorState(error));
      });
    } else {
      emit(NewGetScienceSuccessState());
    }
  }
}
