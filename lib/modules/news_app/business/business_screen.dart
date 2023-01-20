import 'package:bmi_flutter_app/layout/news_app/cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/news_app/cubit/states.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,newsStates>(
        listener: (context,state){},
        builder: (context,state){
          var list=newsCubit.get(context).business;
          return state is! newsGetBusinessLodingState?
          articleBuilder(list,context):Center(
            child: CircularProgressIndicator(),
          );

        },
        );
  }
}
