import 'package:bmi_flutter_app/modules/todo_app/Done_task/Done_Tesk.dart';
import 'package:bmi_flutter_app/modules/todo_app/archived_task/archived_task.dart';
import 'package:bmi_flutter_app/modules/todo_app/new_task/new_task.dart';
import 'package:bmi_flutter_app/shared/cubit/states.dart';
import 'package:bmi_flutter_app/shared/network/local/cach_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class appCubit extends Cubit<AppStates> {

  appCubit() :super(appInitialState());

  static appCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex=0;
  List<Widget> screens=[
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchivedTaskScreen()
  ];
  List<String> title=[
    'New Task',
    'Done Task',
    'Archived Task',
  ];

  void changeIndex(int index){
    currentIndex=index;
    emit(appChangeIndex());
  }


  late Database database;
  // ignore: non_constant_identifier_names
  String TableName = 'tasks';


  List<Map> newTasks=[];
  List<Map> doneTasks=[];
  List<Map> archivedTasks=[];



  void createDatabase()
  {
     openDatabase(
        'todo.dp',
        version: 1,
        onCreate: (database,version) async{
          print("dataBase Created");

          await database.execute('CREATE TABLE $TableName(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value) {
            print('Table Created');

          }).catchError((error){
            print('Error happened when create table ${error.toString()}');
          });
        },
        onOpen: (database){
          getDataFromDatabase(database);
          print('database opened');
         }

    ).then((value) {
      database=value;
      emit(appCreateDatabase());
          });
  }
   InsertToDatabase({
    required String title,
    required String date,
    required String time,
  })async{
    await database.transaction((txn)async {
       txn.rawInsert('INSERT INTO $TableName(title,date,time,status) VALUES("$title","$date","$time","new")').
      then((value) => {

       print('$value Inserted Successfully'),
       emit(appInsertToDatabase()),
       getDataFromDatabase(database),
      }).catchError((error){
        print('Error happened when Inserted into table ${error.toString()}');
      });
    });

  }
  void getDataFromDatabase(dp)
  {
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];
    emit(appGetDatabaseLoadingState());
     dp.rawQuery('SELECT * FROM $TableName ').then((value) {



       value.forEach((element) {
          if(element['status']=="new"){
            newTasks.add(element);
          }
          else if(element['status']=="done") {
            doneTasks.add(element);
          }
          else if(element['status']=="archived") {
            archivedTasks.add(element);
          }
          print("done $doneTasks");
       });






       emit(appGetDatabase());

     });
  }
  bool isButtomSheetShow = false;
  IconData FABIcaon = Icons.edit;

  void changeIcons({
    required bool isShow,
    required IconData icon,
}){
    isButtomSheetShow=isShow;
    FABIcaon =icon;

    emit(appChangeFabBottomIcon());



}

void updateDatabase({
    required String status,
    required int id
  })async{

    await database.rawUpdate(
        'UPDATE $TableName SET status = ? WHERE id = ?',
        ['$status', id ]).then((value) {
      getDataFromDatabase(database);

      emit(appUpdateDatabase());

    });



  }

  void deleteDatabase({
    required int id
  })async{

    await database.rawDelete('DELETE FROM $TableName WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);

      emit(appDeleteDataFromDatabase());

    });



  }

bool isDark=false;

  void changeMode({bool? fromShared}){
   if (fromShared !=null){
     isDark=fromShared;
     emit(appChangeModeStates());
   }
   else{
     isDark=!isDark;
     CachHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
       emit(appChangeModeStates());
     });
   }


  }
}







