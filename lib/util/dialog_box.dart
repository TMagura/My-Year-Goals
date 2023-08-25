import 'package:flutter/material.dart';
import 'package:something/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
   super.key,
   required this.controller,
   required this.onSave,
   required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Colors.green[200],
      content: Container(
        height: 120,
        child: Column(children: [
          //gets user inputs
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "type task here !!",
            ),
          ),SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //save button
            MyButton(text: "Save",onPressed: onSave,),
            //cancel button
            MyButton(text: "Cancel",onPressed: onCancel,),
         ]), 
        ]),
      ),
    );
  }
}