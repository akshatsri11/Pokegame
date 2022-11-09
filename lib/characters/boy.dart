// ignore_for_file: must_be_immutable, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class Myboy extends StatelessWidget {
  final int bodySprintCount;
  final String direction;
  final String location;
  double height = 20;
  Myboy(
      {super.key,
      required this.bodySprintCount,
      required this.direction,
      required this.location});

  @override
  Widget build(BuildContext context) {
    if (location == 'littleroot') {
      height = 20;
    } else if (location == 'pokelab') {
      height = 30;
    } else if (location == 'battleground' ||
        location == 'attackoptions' ||
        location == 'battlefinishedscreen') {
      height = 0;
    }

    return Container(
      height: height,
      child: Image.asset(
        'lib/images/boy' + direction + bodySprintCount.toString() + '.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
