import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyDatabase {
  //list that we are going to use
  List List_Tile = [];

  //Reference is made to the box
  final _mybox = Hive.box('mybox');

  ///Default tasks if this is the  the first time running the app
  void DefaultTasks() {
    List_Tile = [
      ['Do Exercises', false],
      ['Evening Walk', false],
    ];
  }

  ///Load Data

  void LoadData() {
    List_Tile = _mybox.get('List');
  }

  ///Update database

  void UpdateDatabase() {
    _mybox.put('List', List_Tile);
  }
}
