import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskComplete,
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children:[
            SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor:Color.fromARGB(255, 253, 155, 155),
            borderRadius: BorderRadius.circular(120),
             )
          ]),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12)
            ),
                    child: Row(
            children: [
              //checkbox First
              Checkbox(
                value: taskComplete, 
                onChanged: onChanged,
                activeColor: Colors.black,),
              //task name
                 Text(taskName,
                 style:TextStyle(
                  decoration: taskComplete
                   ? TextDecoration.lineThrough 
                   : TextDecoration.none,
                 ),),
            ],
          ),
        ),
      ),
    );
  }
}