import 'package:bmi_flutter_app/layout/social_app/social_cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/social_app/social_cubit/state.dart';
import 'package:bmi_flutter_app/models/social_app/message_model.dart';
import 'package:bmi_flutter_app/models/social_app/user_model.dart';
import 'package:bmi_flutter_app/shared/styles/colors.dart';
import 'package:bmi_flutter_app/shared/styles/icon_broken.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel userModel;
  ChatDetailsScreen({required this.userModel});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {

        SocialCubit.get(context)
            .getMessages(
            receiverId: userModel.uId);
        return BlocConsumer<SocialCubit,SocialStates>(
          listener: (context,state){},
          builder: (context,state){
            var messageController=TextEditingController();
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage:NetworkImage(userModel.image),
                    ),
                    SizedBox(
                      width:6.0,
                    ),
                    Text(userModel.name,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),),

                  ],
                ),
                actions: [

                  IconButton(onPressed:( ){

                  },
                      icon: Icon(IconBroken.Info_Circle))
                ],
              ),
              body: ConditionalBuilder(
                  condition: SocialCubit.get(context).messages.length>0,
                  builder: (context)=>Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [

                        Expanded(
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                              itemBuilder: (context,index){
                                var message=SocialCubit.get(context).messages[index];
                                if(SocialCubit.get(context).userModel.uId==message.senderId)
                                  return buildMyMessages(message);
                                return buildMessages(message);
                              },
                              separatorBuilder: (context,index)=>SizedBox(
                                height: 15.0,
                              ),
                              itemCount: SocialCubit.get(context).messages.length),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1.0
                              ),
                              borderRadius:BorderRadius.circular(15.0)

                          ),
                          clipBehavior:Clip.antiAliasWithSaveLayer ,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,

                                      hintText: 'type your message here........'
                                  ),
                                  controller: messageController,
                                  style: TextStyle(color:  Colors.black,),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                color: defultColor,
                                child: MaterialButton(
                                  onPressed: (){

                                    SocialCubit.get(context).sendMessage(
                                        receiverId: userModel.uId,
                                        text: messageController.text,
                                        dateTime: DateTime.now().toString());

                                  },
                                  minWidth: 1.0,


                                  child: Icon(
                                    IconBroken.Send,
                                    color: Colors.white,
                                    size: 16.0,
                                  ),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  fallback:(context)=>Center(child: CircularProgressIndicator(),)),

            );
          },
        );
      },

    );


  }
  Widget buildMessages(MessageModel model)=> Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd:Radius.circular(10.0) ,
                topStart:Radius.circular(10.0),
                topEnd:Radius.circular(10.0))
        ),
        padding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0
        ),
        child:
        Text('${model.text}')),
  );
      Widget buildMyMessages(MessageModel model)=>Align(
        alignment:AlignmentDirectional.centerEnd,
        child: Container(
            decoration: BoxDecoration(
                color:defultColor.withOpacity(0.2),
                borderRadius: BorderRadiusDirectional.only(
                    topStart:Radius.circular(10.0),
                    topEnd:Radius.circular(10.0) ,
                    bottomEnd:Radius.circular(10.0)
                )
            ),
            padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0
            ),
            child:Text('${model.text}')
        ),
      );
}
