import 'package:bloc/bloc.dart';
import 'package:bmi_flutter_app/layout/shop_app/cubit/states.dart';
import 'package:bmi_flutter_app/models/shop_app/categories_model.dart';
import 'package:bmi_flutter_app/models/shop_app/change_fav_model.dart';
import 'package:bmi_flutter_app/models/shop_app/home_layout_model.dart';
import 'package:bmi_flutter_app/models/shop_app/login_model.dart';
import 'package:bmi_flutter_app/modules/shop_app/categories/categories.dart';
import 'package:bmi_flutter_app/modules/shop_app/favorite/favorite.dart';

import 'package:bmi_flutter_app/modules/shop_app/product/product.dart';
import 'package:bmi_flutter_app/modules/shop_app/seeting/settings.dart';
import 'package:bmi_flutter_app/shared/component/constants.dart';
import 'package:bmi_flutter_app/shared/network/endpoints.dart';
import 'package:bmi_flutter_app/shared/network/remote/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() :super(HomeLayoutInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomNavigationScreens = [
    ProductScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingsScreen(),

  ];

  List<BottomNavigationBarItem> bottomNavHomeItems = [
    BottomNavigationBarItem(
        icon: Icon(
            Icons.home

        ),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.apps

        ),
        label: 'Categories'),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.favorite
        ),
        label: 'Favorite'),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.settings

        ),
        label: 'Settings'),


  ];

  void changeBottomNavItems(int index) {
    currentIndex = index;
    emit(HomeLayoutChangeIndexState());
  }

   late HomeModel homeModel;
  Map<int, bool>favorite={};

  void getHomeData() {
    emit(HomeLayoutLoadingState());
    DioHelper.getData(
        url: HOME,
        token: token)
        .then((value) {
      homeModel =HomeModel.fromJson(value.data);

      homeModel.data.products.forEach((element) {
        favorite.addAll({
          element.id: element.inFavorite
        });
      });
      print(favorite.toString());
      emit(HomeLayoutSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeLayoutErrorState(error.toString()));
    });
  }

  late CategoriesModel categoriesModel;

  void getCategoriesData() {
    emit(HomeLayoutLoadingState());
    DioHelper.getData(
        url: CATEGORIES,
        token: token)
        .then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(CategoriesLayoutSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesLayoutErrorState(error.toString()));
    });
  }

 late ChangeFavoriteModel changeFavoriteModel;
  void changeFavoriteList(int productId) {

    DioHelper.postData(
        url:FAVORITE,
        data: {
          'product_id':productId

        },
    token: token)
        .then((value) {
          changeFavoriteModel=ChangeFavoriteModel.fromJson(value.data);
          emit(FavoriteLayoutSuccessfulState());
    }).catchError((
        error) {
      emit(FavoriteLayoutErrorState(error.toString()));
    });
  }


  late ShopLoginModel userData;

  void getUserData()
  {
    emit(HomeLayoutLoadingState());
    DioHelper.getData(
        url: PROFILE,
        token: token)
        .then((value) {
      userData = ShopLoginModel.fromJson(value.data);
      print(userData.data!.name);
      emit(UserDataLayoutSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(UserDataLayoutErrorState(error.toString()));
    });
  }


}