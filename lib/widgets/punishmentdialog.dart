import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PunishmentDialog extends StatelessWidget {
  String msg;
  PunishmentDialog({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 0.2.sw,
        height: 0.4.sh,
        child: Stack(children: [
          Lottie.asset("assets/lottie/devil.json"),
          Padding(
            padding: EdgeInsets.only(top: 0.2.sh),
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
          Padding(
            padding: EdgeInsets.only(top: 0.32.sh, left: 0.2.sw),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent,
                ),
                width: 0.2.sw,
                height: 0.05.sh,
                child: Center(
                  child: Text(
                    "OK",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.amberAccent),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
