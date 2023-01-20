import 'package:bmi_flutter_app/layout/news_app/cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/news_app/cubit/states.dart';
import 'package:bmi_flutter_app/modules/search/search.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/cubit/cubit.dart';
import 'package:bmi_flutter_app/shared/network/remote/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<newsCubit,newsStates>(
           listener: (BuildContext context, state) {  },
           builder: (BuildContext context,  state) {
             newsCubit news=newsCubit.get(context);
             return Scaffold(
               appBar: AppBar(
                 title: Text("News App"),

                 actions: [
                   IconButton(
                       onPressed: (){
                         navigateTo(context,SearchScreen());
                       },
                       icon: Icon(Icons.search),),
                   IconButton(
                     onPressed: (){
                       appCubit.get(context).changeMode();

                     },
                     icon: Icon(Icons.brightness_6_rounded),)
                 ],
               ),
               body: news.newsScreens[news.currentIndex],
               bottomNavigationBar: BottomNavigationBar(
                 currentIndex: news.currentIndex,
                 onTap: (index){
                   news.changeIndex(index);
                 },
                 items: news.bottomItems,

               ),


             ) ;


           },

         );
  }
}
