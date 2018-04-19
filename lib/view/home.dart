import 'package:flutter/material.dart';
import 'drawer.dart';



class SwoleLogHome extends StatefulWidget{
  @override
  SwoleLogHomeState createState() => new SwoleLogHomeState();
}

class SwoleLogHomeState extends State<SwoleLogHome> {
  double setWeight = 0.0;
  double repCount = 0.0;

  static final GlobalKey<SwoleLogHomeState> _scaffoldKey = new GlobalKey<SwoleLogHomeState>();
  @override
  void initState() {
    super.initState();
    // controller
  }

  @override
  void dispose() {
    super.dispose();
  }

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
    RaisedButton calculateButton = new RaisedButton(
      child: new Text("Save set"),
      onPressed: () {
        AlertDialog dialog = new AlertDialog(
            content: new Text("Data saved to database"));
        showDialog(context: context, child: dialog);
      });

    Widget home = new Scaffold(
      key: _scaffoldKey,
      drawer: new SwoleLogDrawer(),

      body: new Container(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
              children: [setWeightField, repCountField, calculateButton]
          )
      )
    );

    return home;
  }
}