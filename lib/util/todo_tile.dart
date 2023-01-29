

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
   String taskName="";
   bool taskCompleted=false;
  Function(bool?)?onChanged;
  Function(BuildContext)?deleteFunction;
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:25.0,right: 25.0,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [ 
            SlidableAction(onPressed: deleteFunction,
                            icon: Icons.delete,
                            backgroundColor: Colors.red.shade300,
                            borderRadius:BorderRadius.circular(12.0),)
          ],
        ),
        child: Container( 
                padding: const EdgeInsets.all(24),
                child: Row(children: [
                     Checkbox(value:taskCompleted, onChanged: onChanged,activeColor:Colors.black,),
                      // Task Name
                      Text(taskName,
                           style:TextStyle(decoration:taskCompleted? TextDecoration.lineThrough:TextDecoration.none)),
                  ],
                ),
                decoration:BoxDecoration(color:Colors.yellow, 
                                         borderRadius:BorderRadius.circular(12.0)
                                         ),
          ),
      ),
      );
  }
}