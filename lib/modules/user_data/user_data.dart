import '../../models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/analysis_options_user.yaml';




  class UserScreen extends StatelessWidget {


  List<userModel> users=[
    userModel(id: 1, name: "Ahmed Fadlalla", phone: "+201159114666"),
    userModel(id: 2, name: "Ahmed Agag", phone: "+201159114222"),
    userModel(id: 3, name: "Mohamed Saif", phone: "+201159114444"),
    userModel(id: 1, name: "Ahmed Fadlalla", phone: "+201159114666"),
    userModel(id: 2, name: "Ahmed Agag", phone: "+201159114222"),
    userModel(id: 3, name: "Mohamed Saif", phone: "+201159114444"),
    userModel(id: 1, name: "Ahmed Fadlalla", phone: "+201159114666"),
    userModel(id: 2, name: "Ahmed Agag", phone: "+201159114222"),
    userModel(id: 3, name: "Mohamed Saif", phone: "+201159114444"),
    userModel(id: 1, name: "Ahmed Fadlalla", phone: "+201159114666"),
    userModel(id: 2, name: "Ahmed Agag", phone: "+201159114222"),
    userModel(id: 3, name: "Mohamed Saif", phone: "+201159114444"),
    userModel(id: 1, name: "Ahmed Fadlalla", phone: "+201159114666"),
    userModel(id: 2, name: "Ahmed Agag", phone: "+201159114222"),
    userModel(id: 3, name: "Mohamed Saif", phone: "+201159114444"),
    userModel(id: 1, name: "Ahmed Fadlalla", phone: "+201159114666"),
    userModel(id: 2, name: "Ahmed Agag", phone: "+201159114222"),
    userModel(id: 3, name: "Mohamed Saif", phone: "+201159114444"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Users Data",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Colors.red ),),

        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
              itemBuilder: (context,index)=>buildUserData(users[index]),
              separatorBuilder: (context,index)=>Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
              itemCount: users.length),
        ),
      ),
    );
  }

  Widget buildUserData(userModel user)=>Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue,
            child: Text("${user.id}",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${user.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.grey),),
                Text("${user.phone}",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.grey)),

              ],

            ),
          ),

        ],
      ),
  );
}
