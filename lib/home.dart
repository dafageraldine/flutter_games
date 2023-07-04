import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/controller/homecontroller.dart';
import 'package:games/snakegame/createpunishment.dart';
import 'package:games/widgets/box.dart';
import 'package:games/widgets/fiveboxinrowabove.dart';
import 'package:games/widgets/fiveboxinrowdown.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Obx(
          () => Stack(
            children: [
              Column(children: [
                0.04.sh.verticalSpace,
                ListView.builder(
                  itemBuilder: (c, i) {
                    return _homeController.listNumber[i] % 2 == 0
                        ? FiveBoxInRowDown(
                            start: _homeController.listNumber[i],
                            diceCondition: _homeController.diceCondition.value,
                            diceConditionf:
                                _homeController.diceConditionf.value,
                            listnumber: _homeController.listNumberpunishment)
                        : FiveBoxInRowAbove(
                            start: _homeController.listNumber[i],
                            diceCondition: _homeController.diceCondition.value,
                            diceConditionf:
                                _homeController.diceConditionf.value,
                            listnumber: _homeController.listNumberpunishment);
                  },
                  itemCount: _homeController.listNumber.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                ),
                0.04.sh.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        // _homeController.getPunishment();
                        Get.to(CreatePunishment());
                      },
                      child: Container(
                        width: 0.3.sw,
                        height: 0.18.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade800),
                        child: Center(
                            child: Text(
                          "Buat Hukuman",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w800),
                        )),
                      ),
                    ),
                  ],
                ),
                0.04.sh.verticalSpace,
              ]),
              _homeController.diceCondition.value == 100 ||
                      _homeController.diceConditionf.value == 100
                  ? Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Center(
                          child: Lottie.asset("assets/lottie/fireworks.json")),
                    )
                  : 0.0.sw.verticalSpace,
              _homeController.diceCondition.value == 100 ||
                      _homeController.diceConditionf.value == 100
                  ? Padding(
                      padding: EdgeInsets.only(top: 0.4.sh),
                      child: Center(
                          child: Lottie.asset("assets/lottie/fireworks.json")),
                    )
                  : 0.0.verticalSpace,
              _homeController.diceCondition.value == 100 ||
                      _homeController.diceConditionf.value == 100
                  ? Padding(
                      padding: EdgeInsets.only(top: 0.8.sh),
                      child: Center(
                          child: Lottie.asset("assets/lottie/fireworks.json")),
                    )
                  : 0.0.verticalSpace,
              _homeController.diceCondition.value == 100 ||
                      _homeController.diceConditionf.value == 100
                  ? Padding(
                      padding: EdgeInsets.only(top: 1.2.sh),
                      child: Center(
                          child: Lottie.asset("assets/lottie/fireworks.json")),
                    )
                  : 0.0.verticalSpace,
            ],
          ),
        )),
        floatingActionButton: Obx(() => InkWell(
              onTap: () {
                _homeController.diceCondition.value == 100 ||
                        _homeController.diceConditionf.value == 100
                    ? _homeController.reset()
                    : _homeController.rolldice();
                // _homeController.showAlertDialog();
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
