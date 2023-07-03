import 'dart:math';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var listNumber = [
    100,
    91,
    90,
    81,
    80,
    71,
    70,
    61,
    60,
    51,
    50,
    41,
    40,
    31,
    30,
    21,
    20,
    11,
    10,
    1
  ];
  RxInt diceCondition = 0.obs;
  RxInt diceConditionf = 0.obs;
  RxString player = "m".obs;
  var listNumberpunishment = [4, 13, 25, 37, 60, 72, 84];
  RxList listpunishmentf = [].obs;
  RxList listpunishmentm = [].obs;

  void getPunishment() {}

  void reset() {
    diceCondition.value = 0;
    diceConditionf.value = 0;
    final random = Random();
    var gender = 1 + random.nextInt(2 - 1 + 1);
    if (gender == 1) {
      player.value = "f";
    } else {
      player.value = "m";
    }
  }

  void rolldice() {
    if (player.value == "f") {
      final random = Random();
      var adder = 1 + random.nextInt(6 - 1 + 1);
      if ((diceConditionf.value + adder) <= 100) {
        diceConditionf.value = diceConditionf.value + adder;
      }
      // if (diceCondition.value > 100) {
      //   diceCondition.value =
      //       diceCondition.value - ((diceCondition.value - 100) * 2);
      // }
      if (adder != 6) {
        player.value = "m";
      }
      print(adder);
      print(diceConditionf.value);
    } else {
      final random = Random();
      var adder = 1 + random.nextInt(6 - 1 + 1);
      if ((diceCondition.value + adder) <= 100) {
        diceCondition.value = diceCondition.value + adder;
      }
      // if (diceCondition.value > 100) {
      //   diceCondition.value =
      //       diceCondition.value - ((diceCondition.value - 100) * 2);
      // }
      if (adder != 6) {
        player.value = "f";
      }
      print(adder);
      print(diceCondition.value);
    }
  }
}
