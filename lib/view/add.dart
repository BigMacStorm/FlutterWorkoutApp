// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:swole_log/utils/uuid.dart';

class GainsLogAdd extends StatefulWidget {
  @override
  _GainsLogAddState createState() => new _GainsLogAddState();
}

class _GainsLogAddState extends State<GainsLogAdd> {
  List<Exercise> _list;

  @override
  void initState() {
    super.initState();
    _list = new List<Exercise>();      
    _list.add(new Exercise("test", new Uuid().generateV4()));
    _list.add(new Exercise("test2", new Uuid().generateV4()));
    _list.add(new Exercise("test3", new Uuid().generateV4()));
    _list.add(new Exercise("test4", new Uuid().generateV4()));
  }

  void _insert(){    
    //TODO: make this have an alertdialog with a text input field to request name on creation
     setState(
       (){
       _list.insert(0, new Exercise("test99", new Uuid().generateV4()));
     });    
  }

  void _remove(){    
    //let the user decide which one to actually delete, im thinking long press and a confirmation.
     setState(
       (){
       _list.remove(_list[0]);
     });    
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
        secondaryHeaderColor: Colors.orangeAccent
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('List of Lifts'),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: _insert,
              tooltip: 'insert a new item',
            ),
            new IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: _remove,
              tooltip: 'remove item',
            ),
          ]
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) => new ExerciseItem(_list[index]),
          itemCount: _list.length,
        ),
      ),
    );
  }
}

class ExerciseItem extends StatelessWidget {
  const ExerciseItem(this.item);

  final Exercise item;  

  Widget _buildTiles(Exercise root) {
    return new ListTile(
      key: new PageStorageKey<Exercise>(root),
      title: new Text(root.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(item);
  }
}


class Exercise {
  Exercise(this.title, this.uuid);
  String title;
  String uuid;
}
