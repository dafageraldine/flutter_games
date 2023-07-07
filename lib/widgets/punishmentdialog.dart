import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class PunishmentDialog extends StatelessWidget {
  String msg;
  PunishmentDialog({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 0.2.sw,
        height: 0.3.sh,
        child: Stack(children: [
          Lottie.asset("assets/lottie/devil.json"),
          Padding(
            padding: EdgeInsets.only(top: 0.23.sh),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              width: 1.sw,
              height: 0.1.sh,
              child: Center(
                child: Text(
                  msg,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ]));
  }
}
