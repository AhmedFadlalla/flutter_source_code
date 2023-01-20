import 'package:bmi_flutter_app/layout/shop_app/cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/shop_app/cubit/states.dart';
import 'package:bmi_flutter_app/models/shop_app/categories_model.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener:(context,state){

      } ,
      builder:(context,state){
        return ListView.separated(
            itemBuilder: (context,index)=>buildCatItem(HomeLayoutCubit.get(context).categoriesModel.data.categoriesData[index]),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount: HomeLayoutCubit.get(context).categoriesModel.data.categoriesData.length);
      } ,
    );
  }

  Widget buildCatItem(ListOfCategoriesDataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image:
          NetworkImage(
              model.image),
          width: 80,
          height: 80,
          fit: BoxFit.cover,),
        SizedBox(width: 20,),
        Text(model.name,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,

          ),),
        Spacer(),
        Icon(Icons.arrow_forward_ios_outlined),


      ]
      ,
    ),
  );
}
