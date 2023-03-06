import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      );
  }
}

class Login extends StatefulWidget{
  @override
  _LoginDemo createState() => _LoginDemo();
}

class _LoginDemo extends State<Login>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: fromCssColor('#FFF7e9'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(child: Image.asset("assets/images/Monstera.png"),)
        ],
      ),
    );
  }
}

