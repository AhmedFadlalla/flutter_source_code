import 'package:bloc/bloc.dart';
import 'package:bmi_flutter_app/models/shop_app/login_model.dart';
import 'package:bmi_flutter_app/modules/shop_app/shop_login/login_cubit/states.dart';
import 'package:bmi_flutter_app/shared/network/endpoints.dart';
import 'package:bmi_flutter_app/shared/network/remote/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class loginCubit extends Cubit<loginStates>{
  loginCubit():super(loginInitialState());

  static loginCubit get(context)=>BlocProvider.of(context);

   late ShopLoginModel loginModel;
void userLogin ({
  required String email,
  required String password,
}){
  emit(loginLoadingState());
  DioHelper.postData(
      url:LOGIN ,
      data: {
        'email':email,
        'password':password,
      }).then((value){
        print(value.data);
        loginModel=ShopLoginModel.fromJson(value.data);

        emit(loginSuccefulState(loginModel));

  }).catchError((error){
    print(error.toString());
    emit(loginErrorState(error.toString()));
  });

}

IconData suffixIcon=Icons.visibility;
bool isPassword=true;

void changePasswordVisibility(){


  emit(loginChangePasswordVisibilityState());
}


}