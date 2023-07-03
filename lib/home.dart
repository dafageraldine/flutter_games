import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/controller/homecontroller.dart';
import 'package:games/widgets/box.dart';
import 'package:games/widgets/fiveboxinrowabove.dart';
import 'package:games/widgets/fiveboxinrowdown.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            0.04.sh.verticalSpace,
            ListView.builder(
              itemBuilder: (c, i) {
                return _homeController.listNumber[i] % 2 == 0
                    ? Obx(() => FiveBoxInRowDown(
                        start: _homeController.listNumber[i],
                        diceCondition: _homeController.diceCondition.value,
                        diceConditionf: _homeController.diceConditionf.value,
                        listnumber: _homeController.listNumberpunishment))
                    : Obx(() => FiveBoxInRowAbove(
                        start: _homeController.listNumber[i],
                        diceCondition: _homeController.diceCondition.value,
                        diceConditionf: _homeController.diceConditionf.value,
                        listnumber: _homeController.listNumberpunishment));
              },
              itemCount: _homeController.listNumber.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
            ),
            0.08.sh.verticalSpace
          ]),
        ),
        floatingActionButton: Obx(() => InkWell(
              onTap: () {
                _homeController.diceCondition.value == 100 ||
                        _homeController.diceConditionf.value == 100
                    ? _homeController.reset()
                    : _homeController.rolldice();
              },
              child: Container(
                width: 0.18.sw,
                height: 0.18.sw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _homeController.diceCondition.value == 100 ||
                            _homeController.diceConditionf.value == 100
                        ? Colors.grey.shade400
                        : _homeController.player.value == "f"
                            ? Colors.pink
                            : Colors.blue),
                child: Center(
                    child: Text(
                  _homeController.diceCondition.value == 100 ||
                          _homeController.diceConditionf.value == 100
                      ? "Reset"
                      : "Kocok Dadu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                )),
              ),
            )));
  }
}

//  FiveBoxInRowDown(
//             start: 100,
//           ),
//           FiveBoxInRowAbove(
//             start: 91,
//           ),
//           FiveBoxInRowDown(
//             start: 90,
//           ),
//           FiveBoxInRowAbove(
//             start: 81,
//           ),
//           FiveBoxInRowDown(
//             start: 80,
//           ),
//           FiveBoxInRowAbove(
//             start: 71,
//           ),
//           FiveBoxInRowDown(
//             start: 70,
//           ),
//           FiveBoxInRowAbove(
//             start: 61,
//           ),
//           FiveBoxInRowDown(
//             start: 60,
//           ),
//           FiveBoxInRowAbove(
//             start: 51,
//           ),
//           FiveBoxInRowDown(
//             start: 50,
//           ),
//           FiveBoxInRowAbove(
//             start: 41,
//           ),
//           FiveBoxInRowDown(
//             start: 40,
//           ),
//           FiveBoxInRowAbove(
//             start: 31,
//           ),
//           FiveBoxInRowDown(
//             start: 30,
//           ),
//           FiveBoxInRowAbove(
//             start: 21,
//           ),
//           FiveBoxInRowDown(
//             start: 20,
//           ),
//           FiveBoxInRowAbove(
//             start: 11,
//           ),
//           FiveBoxInRowDown(
//             start: 10,
//           ),
//           FiveBoxInRowAbove(
//             start: 1,
//           ),
          