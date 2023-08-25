import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
List toDoList =[];

  // call the Hive to use it
  final _mybox = Hive.box('mybox');

  //create first time appearance
  void createInitialData(){
    toDoList = [
      ["this is an example task",false],
      ["this is the example of an archived task",false]
    ];
  }

  // Load data from our database/get data from db
  void loadData(){
    toDoList = _mybox.get("key");
  }

  //update the hive if any changes occur
  void updateData(){
    _mybox.put("key", toDoList);
  }
}