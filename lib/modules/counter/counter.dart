import 'package:bmi_flutter_app/modules/counter/cubit/cubit.dart';
import 'package:bmi_flutter_app/modules/counter/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context)=>counterCubit(),
         child: BlocConsumer<counterCubit,counterStates>(
           listener: (BuildContext context, state) {
             if(state is minusState) print('Minus State ${state.counter}');
             if(state is plusState) print('Plus State ${state.counter}');

           },
           builder: (BuildContext context, state) {
             return Scaffold(
               appBar: AppBar(
                 title: Text('Counter'),
               ),
               body: Center(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     TextButton(
                         onPressed: (){

                           counterCubit.get(context).plus();

                         },
                         child: Text('PLUS',style: TextStyle(fontSize: 20,color: Colors.red),)),
                     SizedBox(width: 20.0,),
                     Text('${counterCubit.get(context).counter}',style: TextStyle(color: Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold),),
                     SizedBox(width: 20.0,),
                     TextButton(
                         onPressed: (){

                           counterCubit.get(context).minus();

                         },
                         child: Text('MINUS',style: TextStyle(fontSize: 20,color: Colors.red),)),


                   ],
                 ),
               ),
             );
           },

         ),);


  }
}


