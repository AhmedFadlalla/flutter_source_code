import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text('Favorite',style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold
      ),)),
    );
  }
}
