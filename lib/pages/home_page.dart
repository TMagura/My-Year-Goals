import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:something/data/database.dart';
import 'package:something/util/dialog_box.dart';
import 'package:something/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   //the Hive call in other classes.
  final _mybox = Hive.box('mybox');
   ToDoDataBase db = ToDoDataBase();

@override
  void initState() {
    super.initState();
    //first time opening the app 
    if(_mybox.get('key') == null){
       db.createInitialData();
    }else{
    //if there is data in the Hive storage 
     db.loadData();
    }
    
  }

  //text controller
  final _controller = TextEditingController();

  //list of to do tasks for testing
  // List toDoList = [
  //   ["have done it #1",true],
  //   ["have done it #2",false],
  // ];

  //check box is changed function
  void checkBoxChanged(bool? value,int index){
     setState(() {
       db.toDoList[index][1]= !db.toDoList[index][1];
     });
     db.updateData();
  }
// add new Task on click
void saveNewTask(){
  setState(() {
    if(_controller.text.isNotEmpty){
    db.toDoList.add([_controller.text,false]);
    _controller.clear();
    }else{
      //
    }
    db.updateData();
  });
  Navigator.of(context).pop();
}
//Create new task 
void createNewTask(){
  showDialog(
    context: context,
    builder: (context)=>DialogBox(
    controller:_controller,
    onSave: saveNewTask,
    onCancel: () => Navigator.of(context).pop(),)
    );
}

//delete task
void deleteTask(int index){
   setState(() {
    db.toDoList.removeAt(index);
   });
   db.updateData();
}
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: const Center(child: Text('MY TO-DO APP')),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskComplete: db.toDoList[index][1],
            onChanged: (value) =>checkBoxChanged(value,index) ,
            deleteFunction: (context)=>deleteTask(index));
          },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
        ),
    );
  }
}