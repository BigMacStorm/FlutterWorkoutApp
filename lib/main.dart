import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:english_words/english_words.dart';
import 'dart:async';


void main() {
  runApp(new MaterialApp(title: 'Set Logger', home: new SetLogger()));
}

class SetLogger extends StatefulWidget {
  @override
  SetLoggerState createState() {
    return new SetLoggerState();
  }
}

class SetLoggerState extends State<SetLogger> {
  double setWeight = 0.0;
  double repCount = 0.0;
  @override
  Widget build(BuildContext context) {

    TextField setWeightField = new TextField(
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(labelText: "Weight amount"),
        onChanged: (String value) {
          try {
            setWeight = double.parse(value.toString());
          } catch (exception) {
            setWeight = 0.0;
          }
        });

// Create another input field
    TextField repCountField = new TextField(
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(labelText: "Number of reps"),
        onChanged: (String value) {
          try {
            repCount = double.parse(value.toString());
          } catch (exception) {
            repCount = 0.0;
          }
        });
    
    // Create button
    RaisedButton calculateButton = new RaisedButton(
        child: new Text("Save set"),
        onPressed: () {
          // Calculate tip and total
          //Store data to database here

          // Generate dialog
          AlertDialog dialog = new AlertDialog(
              content: new Text("Data saved to database"));

          // Show dialog
          showDialog(context: context, child: dialog); // More code goes here
        });

    Container container = new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
            children: [setWeightField, repCountField, calculateButton]));
    AppBar appBar = new AppBar(title: new Text("Set Logger"));
    Scaffold scaffold;
    scaffold = new Scaffold(appBar: appBar, body: container);

    return scaffold;
  }
}
