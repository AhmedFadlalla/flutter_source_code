import 'package:bmi_flutter_app/layout/shop_app/cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/shop_app/cubit/states.dart';
import 'package:bmi_flutter_app/modules/search/search.dart';
import 'package:bmi_flutter_app/modules/shop_app/search/search.dart';
import 'package:bmi_flutter_app/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/cubit/states.dart';
import 'package:bmi_flutter_app/shared/network/local/cach_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=HomeLayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Camp'),
              actions: [
               IconButton( onPressed: (){
                 navigateTo(context, ShopSearchScreen());
               },
                   icon: Icon(
                       Icons.search
                   ),
               )

              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                  cubit.changeBottomNavItems(index);

              },
              items:cubit.bottomNavHomeItems ,
            ),
            body: cubit.bottomNavigationScreens[cubit.currentIndex],
          );
        },
      );
  }
}
