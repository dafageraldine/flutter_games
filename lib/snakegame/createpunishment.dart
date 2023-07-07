import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/controller/snakeGamecontroller.dart';
import 'package:games/widgets/appbaronly.dart';
import 'package:get/get.dart';

class CreatePunishment extends StatelessWidget {
  CreatePunishment({super.key});

  final SnakeGameController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarOnly(),
            Padding(
              padding: EdgeInsets.only(top: 0.02.sh, left: 0.1.sw),
              child: const Text(
                "Hukuman",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(157, 157, 157, 1),
                  fontSize: 16,
                ),
              ),
            ),
            Obx(
              () => Padding(
                  padding: EdgeInsets.only(top: 0.02.sh, left: 0.1.sw),
                  child: SizedBox(
                    width: 0.8.sw,
                    height: 0.07.sh,
                    child: TextFormField(
                        controller: _homeController.punish.value,
                        // obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(157, 157, 157, 0.5),
                              fontSize: 16,
                            ),
                            hintText: "makan cabe")),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.02.sh, left: 0.1.sw),
              child: InkWell(
                onTap: () {
                  _homeController.createPunishment(
                      _homeController.punish.value.text, "f");
                },
                child: Container(
                  width: 0.8.sw,
                  height: 0.07.sh,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink),
                  child: Center(
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.02.sh, left: 0.1.sw),
              child: InkWell(
                onTap: () {
                  _homeController.createPunishment(
                      _homeController.punish.value.text, "m");
                },
                child: Container(
                  width: 0.8.sw,
                  height: 0.07.sh,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: Center(
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
