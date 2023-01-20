

import 'package:bloc/bloc.dart';
import 'package:bmi_flutter_app/layout/news_app/cubit/states.dart';
import 'package:bmi_flutter_app/modules/news_app/business/business_screen.dart';
import 'package:bmi_flutter_app/modules/news_app/science/science_screens.dart';

import 'package:bmi_flutter_app/modules/news_app/sports/sports_screens.dart';
import 'package:bmi_flutter_app/shared/network/remote/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class newsCubit extends Cubit<newsStates> {
  newsCubit() : super(newsInitialState());

  static newsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> newsScreens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(
        icon: Icon(Icons.science), label: "Science"),


  ];

  void changeIndex(index) {
    currentIndex = index;
    // if(index==1)
    //   getSports();
    // if(index==2)
    //   getScience();

    emit(newschangeIndex());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(newsGetBusinessLodingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': 'bbde39db5525421796542fea6daf9df7'
        }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(newsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(newsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(newsGetSportsLodingState());
    if (sports.length == 0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': 'bbde39db5525421796542fea6daf9df7'
          }).then((value) {
        sports = value.data['articles'];
        print(business[0]['title']);
        emit(newsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(newsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(newsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(newsGetScienceLodingState());
    if (science.length == 0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': 'bbde39db5525421796542fea6daf9df7'
          }).then((value) {
        science = value.data['articles'];
        print(business[0]['title']);
        emit(newsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(newsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(newsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(newsGetSearchLodingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {

          'q': '$value',
          'apiKey': 'bbde39db5525421796542fea6daf9df7'
        }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(newsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(newsGetSearchErrorState(error.toString()));
    });
  }
}