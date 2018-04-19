//library swole_log;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swole_log/app.dart';
import 'view/home.dart';


//import 'package:firebase_auth/firebase_auth.dart';

//part 'util/authentication.dart';
//part 'page/splash_page.dart';

class SwoleLogApp extends StatefulWidget{

  const SwoleLogApp( {
    Key key
  }) : super(key: key);

  @override
  SwoleLogAppState createState() => new SwoleLogAppState();
}


class SwoleLogAppState extends State<SwoleLogApp>{
  
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
      title: 'Swole Log',
      theme: new ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
        secondaryHeaderColor: Colors.orangeAccent
      ),
      home: new SwoleLogHome(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new SwoleLogHome(),
        //'/add': (BuildContext context) => new SwoleLogSettings(_configuration, configurationUpdater),
      }
    );
  }
}