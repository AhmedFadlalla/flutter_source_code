import '../bmi/bmi_screen.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int age;
  final bool isMale;
  final double result;

  BMIResultScreen({
  required this.isMale,
  required this.result,
   required this.age});





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULT SCREEN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Gender: ${isMale? 'Male':'Female' }',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text('BMI Result:${result.round()}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            Text('AGE: $age ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder:(BuildContext context) =>BMI() )
                );
              },

            ),



          ],
        ),
      ),
    );
  }}