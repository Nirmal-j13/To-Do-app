import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String text="";

 MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    });
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
      return MaterialButton( 
          onPressed: onPressed,
          color: Theme.of(context).primaryColor,
          child: Text(text),
                 
      );

  }
}