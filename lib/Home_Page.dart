import 'package:flutter/material.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage> 
{
  // text controller 
  final _controller=TextEditingController();
  List todoList = [
    ["Make Tutorial",false],
    ["Do Excercise",false],
   ];
   void checkboxchanged(bool? value,int index)
   { 
         setState(() {
           todoList[index][1]=!todoList[index][1];
         });
   }
   // save the new task
   void saveNewTask()
   {
     setState(() {
       todoList.add([_controller.text,false]);
       _controller.clear();
     });
            Navigator.of(context).pop();
   }
   // create a new task
   void createNewTask()
   {
    showDialog(context: context, builder:(context) {
     return DialogBox(
      controller: _controller,
      OnSave: saveNewTask,
      OnCancel:() => Navigator.of(context).pop(),
     );
    },
    );
   }
   //delete the task
  void deleteTask(int index)
  {
    todoList.removeAt(index);
  }
   @override
  Widget build(BuildContext context) {
     return Scaffold( 
        backgroundColor: Colors.yellow[200],
        appBar: AppBar( 
          elevation: 0,
         title:Text('To Do'),
        ),
        floatingActionButton: FloatingActionButton( 
         onPressed:createNewTask,
         child: Icon(Icons.add),
           
        ),
        body: ListView.builder( 
        itemCount: todoList.length,
        itemBuilder:((context, index) {
          return ToDoTile(
            taskName:todoList[index][0], 
            taskCompleted:todoList[index][1], 
            onChanged:(value) =>checkboxchanged(value,index),
            deleteFunction: (context)=> deleteTask(index),
            );
        }),
        ),
     );
  }
}
