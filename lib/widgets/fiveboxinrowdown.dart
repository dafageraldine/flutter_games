import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'box.dart';

class FiveBoxInRowDown extends StatelessWidget {
  int start;
  int diceCondition;
  int diceConditionf;
  List listnumber;
  FiveBoxInRowDown(
      {super.key,
      required this.start,
      required this.diceCondition,
      required this.diceConditionf,
      required this.listnumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Box(
          width: 0.15.sw,
          height: 0.15.sw,
          color: listnumber.contains(start)
              ? Colors.purple.shade300
              : start == diceCondition
                  ? Colors.blue
                  : start == diceConditionf
                      ? Colors.pink
                      : Colors.amber.shade100,
          teks: (start).toString(),
          tekscolor: listnumber.contains(start)
              ? Colors.white
              : start == diceCondition || start == diceConditionf
                  ? Colors.white
                  : Colors.black,
          fweight: listnumber.contains(start)
              ? FontWeight.w800
              : start == diceCondition || start == diceConditionf
                  ? FontWeight.w800
                  : FontWeight.normal,
        ),
        Box(
          width: 0.15.sw,
          height: 0.15.sw,
          color: listnumber.contains(start - 1)
              ? Colors.purple.shade300
              : start - 1 == diceCondition
                  ? Colors.blue
                  : start - 1 == diceConditionf
                      ? Colors.pink
                      : Colors.amber.shade200,
          teks: (start - 1).toString(),
          tekscolor: listnumber.contains(start - 1)
              ? Colors.white
              : start - 1 == diceCondition || start - 1 == diceConditionf
                  ? Colors.white
                  : Colors.black,
          fweight: listnumber.contains(start - 1)
              ? FontWeight.w800
              : start - 1 == diceCondition || start - 1 == diceConditionf
                  ? FontWeight.w800
                  : FontWeight.normal,
        ),
        Box(
          width: 0.15.sw,
          height: 0.15.sw,
          color: listnumber.contains(start - 2)
              ? Colors.purple.shade300
              : start - 2 == diceCondition
                  ? Colors.blue
                  : start - 2 == diceConditionf
                      ? Colors.pink
                      : Colors.amber.shade100,
          teks: (start - 2).toString(),
          tekscolor: listnumber.contains(start - 2)
              ? Colors.white
              : start - 2 == diceCondition || start - 2 == diceConditionf
                  ? Colors.white
                  : Colors.black,
          fweight: listnumber.contains(start - 2)
              ? FontWeight.w800
              : start - 2 == diceCondition || start - 2 == diceConditionf
                  ? FontWeight.w800
                  : FontWeight.normal,
        ),
        Box(
          width: 0.15.sw,
          height: 0.15.sw,
          color: listnumber.contains(start - 3)
              ? Colors.purple.shade300
              : start - 3 == diceCondition
                  ? Colors.blue
                  : start - 3 == diceConditionf
                      ? Colors.pink
                      : Colors.amber.shade200,
          teks: (start - 3).toString(),
          tekscolor: listnumber.contains(start - 3)
              ? Colors.white
              : start - 3 == diceCondition || start - 3 == diceConditionf
                  ? Colors.white
                  : Colors.black,
          fweight: listnumber.contains(start - 3)
              ? FontWeight.w800
              : start - 3 == diceCondition || start - 3 == diceConditionf
                  ? FontWeight.w800
                  : FontWeight.normal,
        ),
        Box(
          width: 0.15.sw,
          height: 0.15.sw,
          color: listnumber.contains(start - 4)
              ? Colors.purple.shade300
              : start - 4 == diceCondition
                  ? Colors.blue
                  : start - 4 == diceConditionf
                      ? Colors.pink
                      : Colors.amber.shade100,
          teks: (start - 4).toString(),
          tekscolor: listnumber.contains(start - 4)
              ? Colors.white
              : start - 4 == diceCondition || start - 4 == diceConditionf
                  ? Colors.white
                  : Colors.black,
          fweight: listnumber.contains(start - 4)
              ? FontWeight.w800
              : start - 4 == diceCondition || start - 4 == diceConditionf
                  ? FontWeight.w800
                  : FontWeight.normal,
        ),
      ],
    );
  }
}
