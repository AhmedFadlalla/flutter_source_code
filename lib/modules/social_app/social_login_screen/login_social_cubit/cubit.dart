

import 'package:bloc/bloc.dart';
import 'package:bmi_flutter_app/models/shop_app/login_model.dart';
import 'package:bmi_flutter_app/modules/social_app/social_login_screen/login_social_cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates>{
  SocialLoginCubit():super(socialLoginInitialState());

  static SocialLoginCubit get(context)=>BlocProvider.of(context);

   late ShopLoginModel loginModel;
void userLogin ({
  required String email,
  required String password,
}){
  emit(socialLoginLodingState());

  FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password)
      .then((value) {
        print(value.user!.email);
        print(value.user!.uid);
        emit(socialLoginSuccefulState(value.user!.uid));

  }).catchError((error){

    emit(socialLoginErrorState(error.toString()));

  });



}

IconData suffixIcon=Icons.visibility;
bool isPassword=true;

void changePasswordVisibility(){

  isPassword=!isPassword;
  suffixIcon=isPassword?Icons.visibility:Icons.visibility_off;
  
  emit(socialLoginChangePasswordVisibilityState());
}


}