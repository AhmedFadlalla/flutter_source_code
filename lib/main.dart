
import 'package:bmi_flutter_app/layout/shop_app/shop_layout.dart';
import 'package:bmi_flutter_app/layout/social_app/social_cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/social_app/social_home_screen.dart';
import 'package:bmi_flutter_app/modules/basics/loginform/loginform.dart';
import 'package:bmi_flutter_app/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:bmi_flutter_app/modules/social_app/social_login_screen/social_login_screen.dart';
import 'package:bmi_flutter_app/shared/bloc_observer.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/component/constants.dart';
import 'package:bmi_flutter_app/shared/cubit/cubit.dart';
import 'package:bmi_flutter_app/shared/cubit/states.dart';
import 'package:bmi_flutter_app/shared/network/local/cach_helper.dart';
import 'package:bmi_flutter_app/shared/network/remote/dio.dart';
import 'package:bmi_flutter_app/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/shop_app/cubit/cubit.dart';
import 'layout/todo_app/todo_layout.dart';
import 'modules/bmi_app/bmi/bmi_screen.dart';
import 'package:flutter/material.dart';

import 'modules/counter/counter.dart';
import 'modules/basics//login/login_screen.dart';
import 'modules/basics/loginform/signupform.dart';
import 'modules/shop_app/onboarding_screen/onboarding_screen.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on Background Message');
  print(message.data.toString());
  showToast(text: 'on Background Message', state: ToastStates.SUCCESS);
}
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  var token=await FirebaseMessaging.instance.getToken();
  print('token: $token');

  FirebaseMessaging.onMessage.listen((event) {
    print('on Message');
    print(event.data.toString());
    showToast(text: 'on message', state: ToastStates.SUCCESS);

  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('on Message opened app');
    print(event.data.toString());
    showToast(text: 'on message opened app', state: ToastStates.SUCCESS);
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  Widget? widget;
  await CachHelper.init();

  bool? isDark = CachHelper.getData(key: 'isDark');
  // bool? onBoarding = CachHelper.getData(key: 'onBoarding');
  //   token = CachHelper.getData(key: 'token');

   uId=CachHelper.getData(key: 'uId');

  if(uId !=null){

    widget=SocialHomeLayout();
  }
  else{
    widget=SocialLoginScreen();
  }



  // if (onBoarding != null) {
  //   if (token != null)
  //     widget = ShopLayout();
  //   else
  //     widget = ShopLoginScreen();
  // } else {
  //   widget = OnBoardingScreen();
  // }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  MyApp({this.isDark, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => newsCubit()
                ..getBusiness()
                ..getSports()
                ..getScience()),
          BlocProvider(
              create: (context) => appCubit()..changeMode(fromShared: isDark)),
          BlocProvider(create: (context) => HomeLayoutCubit()
            ..getHomeData()
            ..getCategoriesData()..getUserData()

          ),
          BlocProvider(
              create: (context) => SocialCubit()..getUserDate()..getPosts()..getAllUsers(),)
        ],
        child: BlocConsumer<appCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: appCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: NewsLayout(),
            );
          },
        ));
  }
}
