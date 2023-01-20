import 'package:bmi_flutter_app/layout/social_app/social_cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/social_app/social_cubit/state.dart';
import 'package:bmi_flutter_app/modules/social_app/new_post/new_post.dart';
import 'package:bmi_flutter_app/modules/social_app/search/search_screen.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/styles/icon_broken.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialHomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){

        if(state is SocialNewPostState)
          {
            navigateTo(context, SocialNewPostScreen());
          }
      },
      builder: (context,state){
        SocialCubit cubit=SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
             title:Text(
                 cubit.title[cubit.currentIndex]
             ) ,
            actions: [
              IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification)),
              IconButton(onPressed: (){
                navigateTo(context, SocialSearchScreen());
              }, icon: Icon(IconBroken.Search))
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items:cubit.bottomItems ,
            currentIndex: cubit.currentIndex,
            onTap: (index){
            cubit.changeBottomNavIndex(index);
            },
          ),
        );
      },
    );
  }
}
