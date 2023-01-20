import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Search',style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold
        )),
      ),
    );
  }
}
