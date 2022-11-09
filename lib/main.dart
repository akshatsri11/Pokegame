// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, avoid_print, sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokegame/button.dart';
import 'package:pokegame/characters/boy.dart';
import 'package:pokegame/maps/littleroot.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double mapx = 1.125;
  double mapy = 0.45;
  String currentlocation = 'littleroot';
  double step = 0.25;
  int boySprintCount = 0;
  String boyDirection = 'down';

  List<List<double>> noMansLandLittleroot = [
    [0.625, 0.7],
    [0.825, 0.95],
    [0.825, 0.7],
    [0.825, 0.95],
    [0.825, 1.2],
    [0.825, 0.44999999999999996],
  ];

  void moveUp() {
    boyDirection = 'up';
    if (currentlocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapx, mapy)) {
        setState(() {
          mapy += step;
        });
      }
      animateWalk();
    }
  }

  void moveDown() {
    boyDirection = 'down';
    if (currentlocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapx, mapy)) {
        setState(() {
          mapy -= step;
        });
      }
      animateWalk();
    }
  }

  void moveRight() {
    boyDirection = 'right';
    if (currentlocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapx, mapy)) {
        setState(() {
          mapx -= step;
        });
      }
      animateWalk();
    }
  }

  void moveLeft() {
    boyDirection = 'left';
    if (currentlocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapx, mapy)) {
        setState(() {
          mapx += step;
        });
      }
      animateWalk();
    }
  }

  void pressA() {}
  void pressB() {}

  void animateWalk() {
    Timer.periodic(Duration(milliseconds: 59), (timer) {
      setState(() {
        boySprintCount++;
      });
      if (boySprintCount == 3) {
        boySprintCount = 0;
        timer.cancel();
      }
    });
  }

  bool canMoveTo(String direction, var noMansLand, double x, double y) {
    double stepX = 0;
    double stepY = 0;

    if (direction == 'left') {
      stepX = step;
      stepY = 0;
    } else if (direction == 'right') {
      stepX = -step;
      stepY = 0;
    } else if (direction == 'up') {
      stepX = 0;
      stepY = step;
    } else if (direction == 'down') {
      stepX = 0;
      stepY = -step;
    }

    for (int i = 0; i < noMansLand.length; i++) {
      print(x + stepX);
      print(y + stepY);
      if (((noMansLand[i][0]) == (x + stepX)) &&
          ((noMansLand[i][1]) == (y + stepY))) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            child: Stack(children: [
              LittleRoot(x: mapx, y: mapy, currentMap: currentlocation),
              Container(
                  alignment: Alignment(0, 0),
                  child: Myboy(
                    location: currentlocation,
                    bodySprintCount: boySprintCount,
                    direction: boyDirection,
                  ))
            ]),
            color: Colors.black,
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.grey[900],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "G A M E B O Y",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        " 💗 ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "F L U T T E R",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '←',
                                function: moveLeft,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              MyButton(
                                text: '↑',
                                function: moveUp,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '↓',
                                function: moveDown,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '→',
                                function: moveRight,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              MyButton(
                                text: 'a',
                                function: pressA,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: 'b',
                                function: pressB,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "C R E A T E D B Y A K S",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
          ),
        ))
      ]),
    );
  }
}
