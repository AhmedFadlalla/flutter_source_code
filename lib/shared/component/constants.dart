



import 'package:bmi_flutter_app/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/network/local/cach_helper.dart';
import 'package:flutter/cupertino.dart';

List<Map> tasks=[];

void signOut(context){
  CachHelper.removeData(key: 'token').then((value) {
    if(value){
      navigateTo(context, ShopLoginScreen());
    }

  });
}

void printFullText(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) =>print(match.group(0)));

}
String token='';

String? uId;

//baseUrl: http://newsapi.org/
// methode: v2/top-headlines?
// quires: country=eg&category=business&apiKey=6548987cacc64a19a4e82084fce1b2fe


//https://newsapi.org/
// v2/everything?
// q=tesla&apiKey=6548987cacc64a19a4e82084fce1b2fe