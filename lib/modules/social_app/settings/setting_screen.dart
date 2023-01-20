import 'package:bmi_flutter_app/layout/social_app/social_cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/social_app/social_cubit/state.dart';
import 'package:bmi_flutter_app/modules/social_app/edit_profile/edit_profile_screen.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/styles/icon_broken.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) => () {},
      builder: (context, state) {
        SocialCubit cubit = SocialCubit.get(context);
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 230.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Container(
                          height: 190.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                cubit.userModel.cover
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      CircleAvatar(
                        radius: 64,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage: NetworkImage(
                            cubit.userModel.image,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  cubit.userModel.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  cubit.userModel.bio,
                  style: Theme.of(context).textTheme.caption,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                'Posts',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                'Photos',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                'Follower',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                'Following',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      child: Text('Add Photos'),
                      onPressed: () {},
                    )),
                    OutlinedButton(
                      child: Icon(
                        IconBroken.Edit,
                        size: 16.0,
                      ),
                      onPressed: () {
                        navigateTo(context, EditProfileScreen());
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                        onPressed: (){

                          FirebaseMessaging.instance.subscribeToTopic('announcement');
                        },
                        child: Text('Subscribe')),
                    SizedBox(width: 20,),
                    OutlinedButton(
                        onPressed: (){

                          FirebaseMessaging.instance.unsubscribeFromTopic('announcement');
                        },
                        child: Text('UnSubscribe'))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
