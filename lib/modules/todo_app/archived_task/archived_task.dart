import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/cubit/cubit.dart';
import 'package:bmi_flutter_app/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var tasks=appCubit.get(context).archivedTasks;
        return tasks.length>0
            ?ListView.separated(
            itemBuilder: (context,index)=>buildItem(tasks[index],context),
            separatorBuilder: (context,index)=> Padding(
              padding: EdgeInsetsDirectional.only(start: 20.0),
              child:Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ) ,),
            itemCount: tasks.length):
            Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.menu,
                size: 100.0,
                color: Colors.grey,
              ),
              Text("No tasks yet,Please add some tasks",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),)
            ],
          ),
        );
      },
    );
  }
}
