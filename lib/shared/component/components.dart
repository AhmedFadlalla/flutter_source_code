import 'package:bmi_flutter_app/modules/webview/webview.dart';
import 'package:bmi_flutter_app/shared/cubit/cubit.dart';
import 'package:bmi_flutter_app/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required var function,
  required String text,
  bool isUpperCase = true,
  double radius = 10.0,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
Widget defultTextButton({
  required String text,
  required var pressedFunction
})=>TextButton(
    onPressed: pressedFunction,
    child: Text(text.toUpperCase()));
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  var onsubmit,
  var onChange,
  var onTap,
  required var validator,
  required String label,
  required IconData prefixIcon,
  var suffixIcon,
  bool isPassword = false,
  var sufixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      style: TextStyle(
        color: Colors.black
      ),
      decoration: InputDecoration(
        labelText: label,

        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: sufixPressed,
                icon: Icon(
                  suffixIcon,
                ))
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget buildItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  child: Text("${model['time']}"),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${model['title']}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    Text("${model['date']}",
                        style: TextStyle(color: Colors.grey)),
                  ],
                )),
                SizedBox(width: 10.0),
                IconButton(
                    onPressed: () {
                      appCubit
                          .get(context)
                          .updateDatabase(status: 'done', id: model['id']);
                    },
                    icon: Icon(
                      Icons.check_box_rounded,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () {
                      appCubit
                          .get(context)
                          .updateDatabase(status: 'archived', id: model['id']);
                    },
                    icon: Icon(
                      Icons.archive,
                      color: Colors.black45,
                    )),
              ],
            )
          ],
        ),
      ),
      onDismissed: (direction) {
        appCubit.get(context).deleteDatabase(id: model['id']);
      },
    );

Widget defultLoginField({
  required TextEditingController controller,
  required TextInputType inputType,
  required String labelText,
  required IconData preIcon,
  required var tabFunction,
  required var validation,
}) =>
    TextFormField(
      decoration: InputDecoration(
        labelText: '$labelText',
        labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        prefixIcon: Icon(
          preIcon,
        ),
      ),
      keyboardType: inputType,
      controller: controller,
      onTap: tabFunction,
      validator: validation,
    );

Widget materialButtomLogin({
  required var pressFunction,
  required String bottomText,
  Color backgroundColor = Colors.white24,
  double radius=20.0,
  double width=double.infinity,
  Color textColor=Colors.white,

}) {
  return Container(
    child: MaterialButton(
      onPressed: pressFunction,
      child: Text(
        '$bottomText',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color:textColor ),
      ),

    ),

   decoration: BoxDecoration(

     borderRadius: BorderRadius.circular(radius),
     color: backgroundColor,



   ),

  );
}
Widget myDivider()=>Padding(
  padding: EdgeInsetsDirectional.only(start: 20.0),
  child:Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ) ,);
Widget buildBusinessItem(article,context)=>Padding(padding:EdgeInsets.all(20.0) ,

  child: Row(

    children: [

      Container(

        width: 120.0,

        height: 120.0,

        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(

                image:NetworkImage('${article['urlToImage']}'),

                fit: BoxFit.cover



            )

        ),



      ),

      Expanded(

          child: Container(



            height: 120.0,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text("${article['title']}",

                    style:Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,),

                ),

                Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey),)

              ],

            ),

          ))

    ],

  ),);

void navigateTo(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (BuildContext context) =>widget

    )
);

Widget articleBuilder(list,context)=> ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index)=>buildBusinessItem(list[index],context),
    separatorBuilder: (context,index)=>myDivider(),
    itemCount: list.length);

void navigateAndFinsh
    (context,widget)=>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context)=>widget),
            (Route<dynamic> route) => false);

void showToast({
  required String text,
  required ToastStates state
 })=>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates{SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color=Colors.green;
      break;
    case ToastStates.ERROR:
      color=Colors.red;
      break;
    case ToastStates.WARNING:
      color=Colors.amber;
      break;
  }
return color;
}

Widget defaultAppBar(
{
 required BuildContext context,
  var title,
  var actions
}
    )=>AppBar(
  leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon:Icon(IconBroken.Arrow___Left) ),
  title: Text('$title'),
  actions: [actions],
);
