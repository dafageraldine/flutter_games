import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class DiceRoller extends StatelessWidget {
  int dice;
  DiceRoller({super.key, required this.dice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 0.2.sw,
        height: 0.3.sh,
        child: Stack(children: [
          Center(
              child: dice == 0
                  ? Lottie.asset("assets/lottie/dice.json")
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white,
                      ),
                      child: Image.asset("assets/image/dice$dice.png")))
        ]));
  }
}
