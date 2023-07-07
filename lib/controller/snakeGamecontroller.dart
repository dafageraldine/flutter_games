import 'dart:math';
import 'package:flutter/material.dart';
import 'package:games/model/laddersnake.dart';
import 'package:games/widgets/diceroller.dart';
import 'package:get/get.dart';
import '../model/const.dart';

class SnakeGameController extends GetxController {
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
  var listNumberpunishment = [
    4,
    11,
    18,
    25,
    37,
    60,
    72,
    85,
    98,
    89,
    42,
    30,
    54,
    67
  ];
  RxList listpunishmentf = [].obs;
  RxList listpunishmentm = [].obs;
  Rx<TextEditingController> punish = TextEditingController().obs;
  List<LadderSnake> listLadder = <LadderSnake>[
    LadderSnake(5, 15),
    LadderSnake(29, 42),
    LadderSnake(58, 64),
    LadderSnake(86, 94)
  ];
  List<LadderSnake> listSnake = <LadderSnake>[
    LadderSnake(22, 11),
    LadderSnake(46, 37),
    LadderSnake(62, 51),
    LadderSnake(78, 72),
    LadderSnake(99, 89)
  ];

  void showDiceAnimation(int dice, bool bools) {
    Get.dialog(
        AlertDialog(
          backgroundColor: Colors.transparent,
          content: DiceRoller(
            dice: dice,
          ),
        ),
        barrierDismissible: bools);
  }

  void getPunishment() {
    try {
      final random = Random();
      var idx = 0;
      if (player.value == "m") {
        idx = random.nextInt(listpunishmentf.value.length - 1 + 1);
        print(listpunishmentf.value[idx]);
      } else {
        idx = random.nextInt(listpunishmentm.value.length - 1 + 1);
        print(listpunishmentm.value[idx]);
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

  void snakeOrladder() {
    var flag = 0;
    for (var i = 0; i < listLadder.length; i++) {
      if (player.value == "f") {
        if (diceConditionf.value == listLadder[i].firstPos) {
          flag == 1;
          diceConditionf.value = listLadder[i].goto;
          break;
        }
      } else {
        if (diceCondition.value == listLadder[i].firstPos) {
          flag == 1;
          diceCondition.value = listLadder[i].goto;
          break;
        }
      }
    }
    if (flag == 0) {
      for (var i = 0; i < listSnake.length; i++) {
        if (player.value == 'f') {
          if (diceConditionf.value == listSnake[i].firstPos) {
            diceConditionf.value = listSnake[i].goto;
            break;
          }
        } else {
          if (diceCondition.value == listSnake[i].firstPos) {
            diceCondition.value = listSnake[i].goto;
            break;
          }
        }
      }
    }
  }

  Future<void> rolldice() async {
    if (listpunishmentf.value.isEmpty || listpunishmentm.value.isEmpty) {
      Get.snackbar("error", "buat hukuman dahulu !",
          backgroundColor: errwithopacity);
      return;
    }
    showDiceAnimation(0, false);
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
    //for specific player
    if (player.value == "f") {
      //show diceanimation
      final random = Random();
      var adder = 1 + random.nextInt(6 - 1 + 1);
      showDiceAnimation(adder, false);
      await Future.delayed(const Duration(milliseconds: 800));
      Get.back();
      if ((diceConditionf.value + adder) <= 100) {
        for (var i = 0; i < adder; i++) {
          diceConditionf.value++;
          await Future.delayed(const Duration(milliseconds: 500));
        }
      }
      //checking is there any ladder or snake
      snakeOrladder();
      //check is is a punishment number
      if (listNumberpunishment.contains(diceConditionf.value)) {
        getPunishment();
      }
      //check is it 6 to roll again
      if (adder != 6) {
        player.value = "m";
      }
    } else {
      //show diceanimation
      final random = Random();
      var adder = 1 + random.nextInt(6 - 1 + 1);
      showDiceAnimation(adder, false);
      await Future.delayed(const Duration(milliseconds: 800));
      Get.back();
      if ((diceCondition.value + adder) <= 100) {
        for (var i = 0; i < adder; i++) {
          diceCondition.value++;
          await Future.delayed(const Duration(milliseconds: 500));
        }
        // diceCondition.value = diceCondition.value + adder;
      }
      //checking is there any ladder or snake
      snakeOrladder();
      //check is is a punishment number
      if (listNumberpunishment.contains(diceCondition.value)) {
        getPunishment();
      }
      //check is it 6 to roll again
      if (adder != 6) {
        player.value = "f";
      }
    }
  }
}
