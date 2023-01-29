

import 'package:flutter/material.dart';
import 'package:todo/util/mt_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback OnSave;
  VoidCallback OnCancel;
   DialogBox({
    super.key,
    required this.controller,
    required this.OnSave,
    required this.OnCancel
    });
  @override
  Widget build(BuildContext context) {
    return AlertDialog( 
       backgroundColor: Colors.yellow,
       content: Container( 
        height: 120,
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ 
            TextField( 
                 controller:controller,
                 decoration: InputDecoration(
                            border:OutlineInputBorder(),
                            hintText:'Add a new Task'),
            ),
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ 
                 // save button 
                 MyButton(text:"Save", onPressed:OnSave),

                 // cancel button
                 MyButton(text:"Cancel", onPressed:OnCancel),
              ],
            ),
          ],
        ),
       ),
    );
  }
}

