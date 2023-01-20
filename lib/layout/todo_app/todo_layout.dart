import 'package:bmi_flutter_app/modules/todo_app/Done_task/Done_Tesk.dart';
import 'package:bmi_flutter_app/modules/todo_app/archived_task/archived_task.dart';
import 'package:bmi_flutter_app/modules/todo_app/new_task/new_task.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/component/constants.dart';
import 'package:bmi_flutter_app/shared/component/constants.dart';
import 'package:bmi_flutter_app/shared/component/constants.dart';
import 'package:bmi_flutter_app/shared/component/constants.dart';
import 'package:bmi_flutter_app/shared/cubit/cubit.dart';
import 'package:bmi_flutter_app/shared/cubit/states.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

// ignore: must_be_immutable
class TodoLayout extends StatelessWidget {
  // ignore: non_constant_identifier_names

  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var FormKey = GlobalKey<FormState>();
  var TitleController = TextEditingController();
  var TimeController = TextEditingController();
  var DateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => appCubit()..createDatabase(),
      child: BlocConsumer<appCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is appInsertToDatabase){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          appCubit cubit = appCubit.get(context);

          return Scaffold(
                key: ScaffoldKey,
                appBar: AppBar(
                  title: Text(cubit.title[cubit.currentIndex]),
                ),
                body: tasks.length>0
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : cubit.screens[cubit.currentIndex],
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    if (cubit.isButtomSheetShow) {
                      if (FormKey.currentState!.validate()) {
                        cubit.InsertToDatabase(
                            title: TitleController.text,
                            date: DateController.text,
                            time:  TimeController.text);
                      }
                    }
                    else {
                      ScaffoldKey.currentState!
                          .showBottomSheet(
                            (context) => Container(
                              child: Form(
                                key: FormKey,
                                child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormField(
                                      label: 'Title',
                                      type: TextInputType.text,
                                      controller: TitleController,
                                      prefixIcon: Icons.title,
                                      validator: ( value) {
                                        if (value.isEmpty) {
                                          return 'Title must not be empty ${value.toString()}';
                                        }
                                        return null;
                                      }),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  defaultFormField(
                                      label: 'Time',
                                      type: TextInputType.datetime,
                                      controller: TimeController,
                                      prefixIcon: Icons.watch_later_rounded,
                                      validator: ( value) {
                                        if (value.isEmpty) {
                                          return 'Time must not be empty ${value.toString()}';
                                        }
                                        return null;
                                      },
                                      onTap: () {
                                        showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                            .then((value) {
                                          TimeController.text =
                                              value!.format(context).toString();
                                        });
                                      }),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  defaultFormField(
                                      label: 'Date',
                                      type: TextInputType.datetime,
                                      controller: DateController,
                                      prefixIcon: Icons.calendar_today,
                                      validator: ( value) {
                                        if (value.isEmpty) {
                                          return 'Date must not be empty ${value.toString()}';
                                        }
                                        return null;
                                      },
                                      onTap: () {
                                        showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate:
                                            DateTime.parse('2021-12-09'))
                                            .then((value) {
                                          DateController.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      })
                                ],
                              ),),
                            ),
                            elevation: 20.0,
                          )
                          .closed
                          .then((value) {
                        cubit.changeIcons(isShow: false, icon: Icons.edit);
                      });
                      cubit.changeIcons(isShow: true, icon: Icons.add);
                    }
                  },
                  child: Icon(cubit.FABIcaon),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: cubit.currentIndex,
                  elevation: 20.0,
                  onTap: (index) {
                    cubit.changeIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.menu), label: 'New'),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.done),
                      label: 'Done',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.archive), label: 'Archived'),
                  ],
                ),
              );
        },
      ),
    );
  }


}
