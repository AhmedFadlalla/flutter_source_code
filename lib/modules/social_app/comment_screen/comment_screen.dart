import 'package:bmi_flutter_app/layout/social_app/social_cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/social_app/social_cubit/state.dart';
import 'package:bmi_flutter_app/models/social_app/user_model.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var textController=TextEditingController();

    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){

        return Scaffold(
          appBar: AppBar(
            title: Text("Comments"),
          ),
          body:   Column(
            children: [
              Expanded(
                child:ListView.separated(
                    itemBuilder: (context,index)=>buildCommentItem(context),
                    separatorBuilder:(context,index)=> myDivider(),
                    itemCount: 15),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        controller: textController,
                       keyboardType: TextInputType.text,

                       decoration: InputDecoration(
                         labelText: 'Write a comment...'

                       ),),
                  ),
                  IconButton(
                      onPressed: (){

                      },
                      icon: Icon(IconBroken.Send,color: Colors.blue,)
                  )
                ],
              )
            ],
          )
        );
      },
    );
  }
  Widget buildCommentItem(context)=> Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(SocialCubit.get(context).userModel.image),
          radius: 20.0,

        ),
        SizedBox(width: 15.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${SocialCubit.get(context).userModel.name}',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black
                ),
              ),
              Text(
                'Comment Comment Comment Comment Comment Comment Comment Comment Comment Comment Comment Comment Comment Comment Comment',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              )
            ],
          ),
        )
      ],
    ),
  );
}
