import 'dart:math';

import 'package:bmi_flutter_app/shared/component/components.dart';

import '../bmi_result/bmi_result-screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIMainScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: BMI(),
    );
  }

}

class BMI extends StatefulWidget {


  @override
   _ScreenBuild createState()=> _ScreenBuild();

}

class _ScreenBuild extends State<BMI> {
  bool isMale=true;
  double height=120.0;
  int Age=20;
  int Weight=60;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
              title: Text(
                "BMI CALCULATOR",
                style: TextStyle(fontSize: 25, color: Colors.white),
              )),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale=true;
                            });
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image:AssetImage('assets/images/male.png'),
                                  height: 90.0,
                                  width: 90.0,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "MALE",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: isMale?Colors.blue: Colors.grey[400]),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale=false;
                            });

                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image:AssetImage('assets/images/female.png'),
                                  height: 90.0,
                                  width: 90.0,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "FEMALE",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: isMale?Colors.grey[400]:Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "${height.round()}",
                              style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5.0,),
                            Text(
                              "CM",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Slider(
                            value:height,
                            max: 220.0,
                            min: 80.0,
                            onChanged: (value){
                              setState(() {
                                height=value;
                              });


                            })
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[400],
                    ),
                  ),

                ),
              ),
              Expanded(

                child:Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "WEIGHT",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),),
                              Text(
                                "${Weight}",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        Weight++;
                                      });


                                    },
                                    heroTag: 'weight+',
                                    child: Icon(Icons.add),
                                    mini: true,


                                  ),
                                  FloatingActionButton(

                                    onPressed: (){
                                      setState(() {
                                        Weight--;
                                      });


                                    },
                                    heroTag: 'weight-',
                                    child: Icon(Icons.remove),
                                    mini: true,

                                  ),
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[400]),

                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "AGE",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),),
                              Text(
                                "${Age}",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        Age++;
                                      });

                                    },
                                    heroTag: 'age+',
                                    child: Icon(Icons.add),
                                    mini: true,

                                  ),
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        Age--;
                                      });

                                    },
                                    heroTag: 'age-',
                                    child: Icon(Icons.remove),
                                    mini: true,

                                  ),
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[400]),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: () {


                    double result=Weight/pow(height/100,2);

                    print(result.round());

                    navigateTo(context,BMIResultScreen(isMale: isMale,age: Age,result: result,));



                  },
                  height: 50.0,
                  child: Text("CALCULATE",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              )
            ],
          ));
  }
}







