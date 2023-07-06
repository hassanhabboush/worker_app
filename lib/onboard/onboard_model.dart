import 'package:flutter/material.dart';

class OnboardModel {
  String img;
  String text;

  // String desc;
  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    // required this.desc,
    required this.bg,
    required this.button,
  });
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    img: 'assets/images/mobile1.png',
    text: "Fast reservation with technicians\nand craftsmen",
    // desc:
    //     "and craftsmen",
    bg: Colors.white,
    button: Colors.cyanAccent,
  ),
  OnboardModel(
    img: 'assets/images/mobile3.png',
    text: 'Fast reservation with technicians\n and craftsmen',
    // desc: 'desc',
    bg: Colors.white,
    button: Colors.cyanAccent,
  ),
  OnboardModel(
    img: 'assets/images/mobile2.png',
    text: 'Fast reservation with technicians \nand craftsmen',
    // desc: 'desc',
    bg: Colors.white,
    button: Colors.cyanAccent,
  ),
];
