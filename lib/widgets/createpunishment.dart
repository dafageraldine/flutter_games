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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/image/grass.png",
                  width: 1.sw,
                  height: 0.5.sh,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/image/grass.png",
                  width: 1.sw,
                  height: 0.5.sh,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarOnly(),
                  Padding(
                    padding: EdgeInsets.only(top: 0.02.sh, left: 0.1.sw),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Hukuman",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                        padding: EdgeInsets.only(top: 0.02.sh, left: 0.1.sw),
                        child: Container(
                          width: 0.8.sw,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 0.07.sh,
                          child: TextFormField(
                              controller: _homeController.punish.value,
                              // obscureText: true,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9E9E9E),
                                    fontSize: 16,
                                  ),
                                  hintText: "makan cabe")),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.02.sh, left: 0.25.sw),
                    child: InkWell(
                      onTap: () {
                        _homeController.createPunishment(
                            _homeController.punish.value.text, "f");
                      },
                      child: SizedBox(
                          width: 0.5.sw,
                          height: 0.075.sh,
                          child: Image.asset(
                            "assets/image/pink.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.02.sh, left: 0.25.sw),
                    child: InkWell(
                      onTap: () {
                        _homeController.createPunishment(
                            _homeController.punish.value.text, "m");
                      },
                      child: SizedBox(
                          width: 0.5.sw,
                          height: 0.07.sh,
                          child: Image.asset(
                            "assets/image/blue.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.02.sh, left: 0.25.sw),
                    child: InkWell(
                      onTap: () {
                        _homeController.resetPunishment();
                      },
                      child: SizedBox(
                          width: 0.5.sw,
                          height: 0.08.sh,
                          child: Image.asset(
                            "assets/image/reset.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 0.02.sh, left: 0.1.sw),
                  //   child: InkWell(
                  //     onTap: () {
                  //       _homeController.listpunishmentf.clear();
                  //       _homeController.listpunishmentm.clear();
                  //     },
                  //     child: Container(
                  //       width: 0.8.sw,
                  //       height: 0.07.sh,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: Colors.blue),
                  //       child: Stack(
                  //         children: [
                  //           Image.asset(
                  //             "assets/image/btn.jpg",
                  //             width: 0.5.sw,
                  //             height: 0.07.sh,
                  //             fit: BoxFit.fill,
                  //           ),
                  //           Center(
                  //             child: Text(
                  //               "reset hukuman",
                  //               style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 12.sp),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ]),
          ],
        ),
      ),
    );
  }
}
