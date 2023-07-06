import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/controller/homecontroller.dart';
import 'package:games/snakegame/createpunishment.dart';
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
              //grass
              Column(
                children: [
                  Image.asset(
                    "assets/image/grass.png",
                    width: 1.sw,
                    height: 0.6.sh,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "assets/image/grass.png",
                    width: 1.sw,
                    height: 0.6.sh,
                    fit: BoxFit.fill,
                  ),
                  Transform.rotate(
                    angle: 180 * (3.1415926535 / 180),
                    child: Image.asset(
                      "assets/image/grass.png",
                      width: 1.sw,
                      height: 0.5.sh,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              //block
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
                  physics: const BouncingScrollPhysics(),
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
                        child: const Center(
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
              //fireworks
              _homeController.diceCondition.value == 100 ||
                      _homeController.diceConditionf.value == 100
                  ? Padding(
                      padding: const EdgeInsets.all(1.0),
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
                      padding: EdgeInsets.only(top: 1.05.sh),
                      child: Center(
                          child: Lottie.asset("assets/lottie/fireworks.json")),
                    )
                  : 0.0.verticalSpace,
              //ladder
              Padding(
                padding: EdgeInsets.only(left: 0.72.sw, top: 1.35.sh),
                child: Image.asset(
                  "assets/image/stairsl.png",
                  width: 0.16.sw,
                  height: 0.12.sh,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.22.sw, top: 0.9.sh),
                child: Image.asset(
                  "assets/image/stairsb.png",
                  width: 0.26.sw,
                  height: 0.22.sh,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.47.sw, top: 0.53.sh),
                child: Transform.rotate(
                  angle: 41 * (3.1415926535 / 180),
                  child: Image.asset(
                    "assets/image/stairsb.png",
                    width: 0.2.sw,
                    height: 0.26.sh,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.63.sw, top: 0.1.sh),
                child: Transform.rotate(
                  angle: -45 * (3.1415926535 / 180),
                  child: Image.asset(
                    "assets/image/stairsb.png",
                    width: 0.2.sw,
                    height: 0.26.sh,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              //snake
              Padding(
                padding: EdgeInsets.only(left: 0.25.sw, top: 0.095.sh),
                child: Transform.rotate(
                  angle: -45 * (3.1415926535 / 180),
                  child: Image.asset(
                    "assets/image/snakes.png",
                    width: 0.2.sw,
                    height: 0.2.sh,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.35.sw, top: 0.35.sh),
                child: Transform.rotate(
                  angle: 0,
                  child: Image.asset(
                    "assets/image/snakes.png",
                    width: 0.2.sw,
                    height: 0.2.sh,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.6.sw, top: 0.83.sh),
                child: Transform.rotate(
                  angle: 0,
                  child: Image.asset(
                    "assets/image/snakes.png",
                    width: 0.26.sw,
                    height: 0.15.sh,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.15.sw, top: 1.2.sh),
                child: Transform.rotate(
                  angle: 0,
                  child: Image.asset(
                    "assets/image/snakes.png",
                    width: 0.26.sw,
                    height: 0.15.sh,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.15.sw, top: 0.615.sh),
                child: Transform.rotate(
                  angle: 0,
                  child: Image.asset(
                    "assets/image/snakes.png",
                    width: 0.26.sw,
                    height: 0.15.sh,
                    fit: BoxFit.fill,
                  ),
                ),
              )
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
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                )),
              ),
            )));
  }
}
