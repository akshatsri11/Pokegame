// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final text;
  final function;

  const MyButton({super.key, this.function, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Colors.white,
              )),
          height: 50,
          width: 50,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
        ),
      ),
    );
  }
}
