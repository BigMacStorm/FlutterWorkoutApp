//library Gains_log;

import 'dart:async';
import 'package:flutter/material.dart';
import 'view/home.dart';
import 'view/add.dart';


//import 'package:firebase_auth/firebase_auth.dart';

//part 'util/authentication.dart';
//part 'page/splash_page.dart';

class GainsLogApp extends StatefulWidget{

  const GainsLogApp( {
    Key key
  }) : super(key: key);

  @override
  GainsLogAppState createState() => new GainsLogAppState();
}


class GainsLogAppState extends State<GainsLogApp>{
  
  @override
  void initState(){
    super.initState();
  }

  @override 
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Gains Log',
      theme: new ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
        secondaryHeaderColor: Colors.orangeAccent
      ),
      home: new GainsLogHome(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new GainsLogHome(),
        '/add': (BuildContext context) => new GainsLogAdd(),
      }
    );
  }
}