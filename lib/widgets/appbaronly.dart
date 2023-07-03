import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarOnly extends StatelessWidget {
  const AppBarOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.12.sh,
      // color: Color.fromRGBO(217, 215, 241, 1),
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.1.sw, top: 0.1.sw),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                width: 0.125.sw,
                height: 0.125.sw,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 0.06.sw,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.08.sw, left: 0.05.sw),
            child: Align(
                alignment: Alignment.center,
                child: Text("Buat Hukuman",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: const Color.fromRGBO(249, 249, 249, 1),
                    ))),
          ),
        ],
      ),
    );
  }
}
