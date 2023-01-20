import 'package:bmi_flutter_app/layout/shop_app/cubit/cubit.dart';
import 'package:bmi_flutter_app/layout/shop_app/cubit/states.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      listener: (context,state){},
      builder: (context,state){
        var nameController=TextEditingController();
        return Column(
          children: [

          ],
        );
      },

    );
  }
}
