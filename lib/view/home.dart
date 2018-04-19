import 'package:flutter/material.dart';
import 'drawer.dart';



class GainsLogHome extends StatefulWidget{
  @override
  GainsLogHomeState createState() => new GainsLogHomeState();
}

class GainsLogHomeState extends State<GainsLogHome> {
  double setWeight = 0.0;
  double repCount = 0.0;

  List<String> listExercise = <String>['Curls', 'Flys'];  
  String selectedExercise = "Test";  

  static final GlobalKey<GainsLogHomeState> _scaffoldKey = new GlobalKey<GainsLogHomeState>();
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
    DropdownButton exerciseDropdown = new DropdownButton<String>(
      //value: selectedExercise,
      onChanged: (String exercise){
        setState(() {
          selectedExercise = exercise;
        });        
      },
      items: listExercise.map((String exercise) {
        return new DropdownMenuItem<String>(
          value: exercise,
          child: new Text(exercise),
        );
      }).toList(),
    );

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
      drawer: new GainsLogDrawer(),

      body: new Container(
          padding: const EdgeInsets.all(40.0),
          alignment: Alignment.bottomCenter,
          child: new Column(
              children: [exerciseDropdown, setWeightField, repCountField, calculateButton]
          )
      )
    );

    return home;
  }
}
