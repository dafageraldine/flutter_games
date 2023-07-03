import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/controller/homecontroller.dart';
import 'package:games/widgets/appbaronly.dart';
import 'package:get/get.dart';

class CreatePunishment extends StatelessWidget {
  CreatePunishment({super.key});

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarOnly(),
            Padding(
              padding: EdgeInsets.only(
                top: 0.02.sh,
              ),
              child: const Text(
                "Value",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(157, 157, 157, 1),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: 0.02.sh,
                ),
                child: SizedBox(
                  width: 0.85.sw,
                  height: 0.07.sh,
                  child: TextFormField(
                      // controller: _recordController.values.value,
                      // obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(157, 157, 157, 0.5),
                            fontSize: 16,
                          ),
                          hintText: "15000000.00")),
                )),
          ]),
    );
  }
}
