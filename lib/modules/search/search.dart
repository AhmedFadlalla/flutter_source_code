import 'package:bmi_flutter_app/layout/news_app/cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/news_app/cubit/states.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController=TextEditingController();
    return BlocConsumer<newsCubit,newsStates>(
       listener: (context,state){},
      builder: (context,state){

         List list=newsCubit.get(context).search;
         return Scaffold(
           appBar: AppBar(),
           body: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: defaultFormField(
                     controller: searchController,
                     onChange: (value){

                       newsCubit.get(context).getSearch(value);
                     },
                     validator: ( value){
                       if(value.isEmpty){
                         return 'Search must not be empty';
                       }
                       return null;
                     },
                     prefixIcon: Icons.search,
                     type: TextInputType.text,
                     label: 'Search'),
               ),
               state is! newsGetSearchLodingState?
               Expanded(child: articleBuilder(list,context)):Center(
                 child: CircularProgressIndicator(),
               )


             ],
           ),
         );
      },
    );
  }
}
