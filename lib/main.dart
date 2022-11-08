// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

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
  double mapx = 0;
  double mapy = 0;
  String currentlocation = 'littleroot';

  void moveUp() {
    setState(() {
      mapy += 0.2;
    });
  }

  void moveDown() {
    setState(() {
      mapy -= 0.2;
    });
  }

  void moveRight() {
    mapx -= 0.2;
  }

  void moveLeft() {
    mapx += 0.2;
  }

  void pressA() {}
  void pressB() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            child: Stack(children: [
              LittleRoot(x: mapx, y: mapy, currentMap: currentlocation),
              Container(alignment: Alignment(0, 0), child: MyBoy())
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
                  Expanded(
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Text("C R E A T E D B Y A K S")
                ]),
          ),
        ))
      ]),
    );
  }
}
