import 'package:flutter/material.dart';

class MyBoy extends StatelessWidget {
  const MyBoy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Image.asset(
        'lib/images/boydown0.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
