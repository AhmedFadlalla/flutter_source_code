import 'dart:io';

import 'package:bmi_flutter_app/layout/social_app/social_cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/social_app/social_cubit/state.dart';
import 'package:bmi_flutter_app/models/social_app/user_model.dart';
import 'package:bmi_flutter_app/models/user/user_model.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController=TextEditingController();
  var bioController=TextEditingController();
  var phoneController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        SocialCubit cubit=SocialCubit.get(context);
        var profileImage=SocialCubit.get(context).profileImage;
        var coverImage=SocialCubit.get(context).coverImage;

        nameController.text=cubit.userModel.name;
        bioController.text=cubit.userModel.bio;
        phoneController.text=cubit.userModel.phone;
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            actions: [
              defultTextButton(
                  text:'Update',
                  pressedFunction: (){
                    cubit.updateProfileData(
                        name: nameController.text,
                        bio: bioController.text,
                        phone: phoneController.text);

                  }),
              SizedBox(width: 15.0,)
            ],

          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if(state is SocialUpdateUserDataLoadingState)
                    LinearProgressIndicator(),
                  if(state is SocialUpdateUserDataLoadingState)
                   SizedBox(height: 5.0,),
                  Container(
                    height: 230.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 190.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image:coverImage ==null?
                                      NetworkImage(
                                        cubit.userModel.cover):FileImage(coverImage)as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    SocialCubit.get(context).getCoverImage();
                                  },
                                  icon:
                                  CircleAvatar(
                                    radius: 20.0,

                                      child:
                                      Icon(
                                          IconBroken.Camera,
                                        size: 16.0,
                                      )))
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64,
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage:
                                profileImage == null?
                                NetworkImage(
                                  cubit.userModel.image,
                                ):
                                     FileImage(profileImage)as ImageProvider,
                              ),
                            ),
                            IconButton(
                                onPressed: (){
                                  SocialCubit.get(context).getProfileImage();
                                },
                                icon:
                                CircleAvatar(
                                    radius: 20.0,
                                    child:
                                    Icon(
                                      IconBroken.Camera,
                                      size: 16.0,
                                    )))

                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if(cubit.profileImage !=null || cubit.coverImage !=null)
                    Row(
                    children: [
                      if(cubit.profileImage !=null)
                        Expanded(
                        child: Column(
                          children: [
                            defultButton(
                                function: (){
                                  cubit.uploadProfileImage(
                                      name: nameController.text,
                                      bio: bioController.text,
                                      phone: phoneController.text);
                                },
                                text: 'upload profile'),
                            if(state is SocialUpdateUserDataLoadingState)
                             SizedBox(height: 5.0,),
                             LinearProgressIndicator(),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      if(cubit.coverImage !=null)
                        Expanded(
                        child: Column(
                          children: [
                            defultButton(
                                function: (){
                                  cubit.uploadCoverImage(
                                      name: nameController.text,
                                      bio: bioController.text,
                                      phone: phoneController.text);
                                },
                                text: 'upload cover'),
                            if(state is SocialUpdateUserDataLoadingState)
                             SizedBox(height: 5.0,),
                             LinearProgressIndicator(),
                          ],
                        ),

                      ),
                    ],
                  ),
                    SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validator: (value){
                        if(value.isEmapty)
                        {
                          return 'Name must not be empty';
                        }
                        return null;
                      },
                      label: 'Name',
                      prefixIcon: IconBroken.User),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                      controller: bioController,
                      type: TextInputType.text,
                      validator: (value){
                        if(value.isEmapty)
                        {
                          return 'bio must not be empty';
                        }
                        return null;
                      },
                      label: 'Bio',
                      prefixIcon: IconBroken.Info_Circle),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validator: (value){
                        if(value.isEmapty)
                        {
                          return 'phone must not be empty';
                        }
                        return null;
                      },
                      label: 'Phone',
                      prefixIcon: IconBroken.Call),


                ],
              ),
            ),
          ) ,
        );
      },
    );
  }
}
