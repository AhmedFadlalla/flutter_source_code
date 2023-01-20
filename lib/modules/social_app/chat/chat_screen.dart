import 'package:bmi_flutter_app/layout/social_app/social_cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/social_app/social_cubit/state.dart';
import 'package:bmi_flutter_app/models/social_app/user_model.dart';
import 'package:bmi_flutter_app/modules/social_app/chat_datails_screen/chat_details_screen.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => buildChatItem(SocialCubit.get(context).users[index],context,),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: SocialCubit.get(context).users.length);
        // return ConditionalBuilder(
        //     condition:  SocialCubit.get(context).user.length>0,
        //     builder: (context)=>ListView.separated(
        //         physics: BouncingScrollPhysics(),
        //         scrollDirection: Axis.vertical,
        //         itemBuilder: (context, index) => buildChatItem(SocialCubit.get(context).user[index],context,),
        //         separatorBuilder: (context, index) => myDivider(),
        //         itemCount: SocialCubit.get(context).user.length),
        //     fallback: (context)=>Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget buildChatItem(SocialUserModel model,context) => InkWell(
        onTap: () {
          navigateTo(context, ChatDetailsScreen(userModel: model,));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  '${model.image}'
                ),
                radius: 20.0,
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                '${model.name}',
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),
        ),
      );
}
