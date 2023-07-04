import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const.dart';

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
  Rx<TextEditingController> punish = TextEditingController().obs;

  void getPunishment() {
    try {
      final random = Random();
      var idx = 0;
      if (player.value == "m") {
        idx = random.nextInt(listpunishmentm.value.length - 1 + 1);
        print(listpunishmentm.value[idx]);
      } else {
        idx = random.nextInt(listpunishmentf.value.length - 1 + 1);
        print(listpunishmentf.value[idx]);
      }
    } catch (e) {
      Get.snackbar("error", "hukuman Tidak Ditemukan !",
          backgroundColor: errwithopacity);
    }
  }

  void createPunishment(hukuman, jenis) {
    if ("f" == jenis) {
      listpunishmentf.add(hukuman);
      punish.value.clear();
      Get.snackbar("success", "hukuman berhasil dibuat !",
          backgroundColor: Colors.white);
    } else {
      listpunishmentm.add(hukuman);
      punish.value.clear();
      Get.snackbar("success", "hukuman berhasil dibuat !",
          backgroundColor: Colors.white);
    }
  }

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
    if (listpunishmentf.value.isEmpty || listpunishmentm.value.isEmpty) {
      Get.snackbar("error", "buat hukuman dahulu !",
          backgroundColor: errwithopacity);
      return;
    }
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
      if (listNumberpunishment.contains(diceConditionf.value)) {
        getPunishment();
      }
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
      if (listNumberpunishment.contains(diceCondition.value)) {
        getPunishment();
      }
    }
  }
}
