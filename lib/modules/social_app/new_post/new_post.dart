import 'package:bmi_flutter_app/layout/social_app/social_cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/social_app/social_cubit/state.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/styles/colors.dart';
import 'package:bmi_flutter_app/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialNewPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textController=TextEditingController();
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){

        var cubit=SocialCubit.get(context);
        var now=DateTime.now();

        var postImage=cubit.postImage ;
        return Scaffold(
          appBar: AppBar(
            title: Text('Add Post'),
            actions: [
              IconButton(
                onPressed: () {
                  if(cubit.postImage==null){
                    cubit.createPost(
                        dateTime: now.toString(),
                        text: textController.text);
                  }
                  else{
                    cubit.uploadPostImage(
                        dateTime: now.toString(),
                        text: textController.text);
                  }

                },
                icon: Text('Post', style: Theme
                    .of(context)
                    .textTheme
                    .caption!
                    .copyWith(
                    fontSize: 16.0,
                    color: defultColor
                ),),)
            ],
            leading: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(IconBroken.Arrow___Left_2)),
          ),
          body:Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                 LinearProgressIndicator(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage:NetworkImage(
                          cubit.userModel.image
                      ) ,
                    ),
                    SizedBox(width: 8.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                           cubit.userModel.name,
                           style: Theme.of(context).textTheme.subtitle2!.copyWith(
                             fontWeight: FontWeight.w600,
                             height: 1.2

                           ),
                         ),
                        Text(
                          'public',
                          style:Theme.of(context).textTheme.caption ,
                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'What\'s is on your mind?',
                      border: InputBorder.none

                    ),
                    controller: textController,
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),
                SizedBox(
                  height:20.0 ,
                ),
                if(cubit.postImage !=null)
                 Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 190.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: FileImage(postImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: (){
                          cubit.removePostImage();
                        },
                        icon:
                        CircleAvatar(
                            radius: 20.0,
                            child:
                            Icon(
                              Icons.close,
                              size: 16.0,
                            )))
                  ],
                ),
                 SizedBox(
                  height:20.0 ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: (){

                            cubit.getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(IconBroken.Image),
                              SizedBox(width:5.0,),
                              Text('Add photo\'s'),
                            ],
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: (){},
                          child:Text('# tags'),),
                    )
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
