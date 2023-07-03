import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  double width;
  double height;
  Color color;
  String teks;
  Color tekscolor;
  FontWeight fweight;
  Box(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.teks,
      required this.tekscolor,
      required this.fweight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Center(
          child: Text(
        teks,
        style: TextStyle(color: tekscolor, fontWeight: fweight),
      )),
    );
  }
}
