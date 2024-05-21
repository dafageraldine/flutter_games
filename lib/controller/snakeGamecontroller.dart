import 'dart:math';
import 'package:flutter/material.dart';
import 'package:games/game/sudokuboard.dart';
import 'package:games/model/laddersnake.dart';
import 'package:games/widgets/diceroller.dart';
import 'package:games/widgets/punishmentdialog.dart';
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
  RxInt isPause = 0.obs;
  RxInt blinkSnake = 0.obs;
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
  List<List<dynamic>> sudokunumber = [];
  List<List<dynamic>> sudokunumbertemp = [];
  List<List<dynamic>> sudokunumberhide = [];
  List<int> currdatav = <int>[];
  List<int> currdataH = <int>[];
  List<int> tempdatav = <int>[];
  List<int> tempdataH = <int>[];
  RxInt donegenerate = 0.obs;
  int lengthCol = 6;
  int scramblingdone = 0;
  var listhidden = [];
  var listhiddencopy = [];

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

  void showPunishment(String msg) {
    Get.dialog(
        AlertDialog(
            backgroundColor: Colors.transparent,
            content: PunishmentDialog(
              msg: msg,
            )),
        barrierDismissible: false);
  }

  void getPunishment() {
    try {
      final random = Random();
      var idx = 0;
      if (player.value == "m") {
        idx = random.nextInt(listpunishmentf.value.length - 1 + 1);
        showPunishment(listpunishmentf.value[idx]);
      } else {
        idx = random.nextInt(listpunishmentm.value.length - 1 + 1);
        showPunishment(listpunishmentm.value[idx]);
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

  Future<void> snakeOrladder() async {
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
            blinkSnake.value = 1;
            await Future.delayed(const Duration(milliseconds: 800));
            blinkSnake.value = 0;
            diceConditionf.value = listSnake[i].goto;
            break;
          }
        } else {
          if (diceCondition.value == listSnake[i].firstPos) {
            blinkSnake.value = 1;
            await Future.delayed(const Duration(milliseconds: 800));
            blinkSnake.value = 0;
            diceCondition.value = listSnake[i].goto;
            break;
          }
        }
      }
    }
  }

  void resetPunishment() {
    listpunishmentf.value.clear();
    listpunishmentm.value.clear();
    Get.snackbar("success", "hukuman berhasil direset !",
        backgroundColor: Colors.white);
  }

  Future<void> rolldice() async {
    if (listpunishmentf.value.isEmpty || listpunishmentm.value.isEmpty) {
      Get.snackbar("error", "buat hukuman dahulu !",
          backgroundColor: errwithopacity);
      return;
    }
    isPause.value = 1;
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
      await snakeOrladder();
      //check is is a punishment number
      if (listNumberpunishment.contains(diceConditionf.value)) {
        getPunishment();
      }
      //check is it 6 to roll again
      if (adder != 6) {
        player.value = "m";
      }
      isPause.value = 0;
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
      await snakeOrladder();
      //check is is a punishment number
      if (listNumberpunishment.contains(diceCondition.value)) {
        getPunishment();
      }
      //check is it 6 to roll again
      if (adder != 6) {
        player.value = "f";
      }
      isPause.value = 0;
    }
  }

  generateRowNumber() {
    donegenerate.value = 0;

    do {
      // Creating a 2D array
      List<List<int>> twoDArray =
          List.generate(6, (index) => List<int>.filled(6, 0));

      //fill array with 1 to n(length)
      for (var i = 0; i < lengthCol; i++) {
        for (var j = 0; j < lengthCol; j++) {
          twoDArray[i][j] = j + 1;
        }
      }

      //randomize array
      for (var i = 0; i < lengthCol; i++) {
        for (var j = 0; j < lengthCol; j++) {
          var curNum = twoDArray[i][j];
          var randIndex = getRandomNumberInRangeExcept(0, lengthCol - 1, j);

          twoDArray[i][j] = twoDArray[i][randIndex];
          twoDArray[i][randIndex] = curNum;
        }
      }
      scrambler(twoDArray);
      checker(twoDArray);
      sudokunumbertemp.clear();
      sudokunumbertemp.addAll(twoDArray);
    } while (scramblingdone == 0);
    gethiddenlist();
    sudokunumber.clear();
    sudokunumber.addAll(sudokunumbertemp);
    scramblingdone = 0;
    donegenerate.value = 1;
  }

  gethiddenlist() {
    listhidden.clear();
    listhiddencopy.clear();
    var summst = 0;
    for (var i = 0; i < lengthCol; i++) {
      summst = summst + (i + 1);
    }
    for (var j = 0; j < lengthCol; j++) {
      num sum = 0;
      for (var i = 0; i < listhidden.length; i++) {
        sum = sum + listhidden[i];
      }
      var sisa = summst - sum!;
      if (sisa < lengthCol) {
        listhidden.add(sisa);
        listhiddencopy.add(0);
      } else {
        var rng = Random();
        listhidden.add(rng.nextInt(6));
        listhiddencopy.add(0);
      }
    }
    sudokunumberhide.clear();
    sudokunumberhide.addAll(sudokunumber);
    for (var j = 0; j < lengthCol; j++) {
      for (var m = 0; m < lengthCol; m++) {
        var hiddenlist = listhidden[j];
        var sisacol = lengthCol - (m + 1);
        var sisahide = hiddenlist - listhiddencopy[j];
        if (listhiddencopy[j] < hiddenlist) {
          if (sisacol > sisahide) {
            var rng = Random();
            var dt = rng.nextInt(2);
            if (dt == 1) {
              sudokunumberhide[j][m] = 0;
              var temp = listhiddencopy[j];
              listhiddencopy[j] = temp + 1;
            }
          } else if (sisacol == sisahide) {
            sudokunumberhide[j][m] = 0;
            var temp = listhiddencopy[j];
            listhiddencopy[j] = temp + 1;
          }
        }
      }
    }
  }

  scrambler(List<List<int>> twoDArray) {
    for (var i = 1; i < lengthCol; i++) {
      for (var j = 0; j < lengthCol; j++) {
        currdatav.clear();
        currdataH.clear();

        //get cant be same vertical
        for (var k = 0; k < i; k++) {
          currdatav.add(twoDArray[k][j]);
        }

        //get cant be same in group
        if (i % 2 == 1) {
          int start = 0;
          int end = lengthCol;
          double multiplier = lengthCol / 3;
          for (var n = 1; n <= multiplier; n++) {
            if (n * 3 > j) {
              start = (n * 3) - 3;
              end = (n * 3);
              break;
            }
          }

          for (var l = i - 1; l < i; l++) {
            for (var m = start; m < end; m++) {
              currdataH.add(twoDArray[l][m]);
            }
          }
        }

        //moving index
        int flag = 0;
        var currData = twoDArray[i][j];
        for (var z = j; z < lengthCol; z++) {
          if (currdatav.isNotEmpty && currdataH.isEmpty) {
            if (currdatav.indexWhere((idx) => idx == twoDArray[i][z]) == -1) {
              twoDArray[i][j] = twoDArray[i][z];
              twoDArray[i][z] = currData;
              flag = 1;
              break;
            }
          } else if (currdatav.isNotEmpty && currdataH.isNotEmpty) {
            if (currdatav.indexWhere((idx) => idx == twoDArray[i][z]) == -1 &&
                currdataH.indexWhere((idx) => idx == twoDArray[i][z]) == -1) {
              twoDArray[i][j] = twoDArray[i][z];
              twoDArray[i][z] = currData;
              flag = 1;
              break;
            }
          }
        }
        if (flag == 0) {
          for (var r = 0; r < lengthCol; r++) {
            if (r == j) {
            } else {
              tempdataH.clear();
              tempdatav.clear();
              //fill tempdatav
              for (var k = 0; k < i; k++) {
                tempdatav.add(twoDArray[k][r]);
              }

              //fill tempdatah
              if (i % 2 == 1) {
                int start = 0;
                int end = lengthCol;
                double multiplier = lengthCol / 3;
                for (var n = 1; n <= multiplier; n++) {
                  if (n * 3 > r) {
                    start = (n * 3) - 3;
                    end = (n * 3);
                    break;
                  }
                }

                for (var l = i - 1; l < i; l++) {
                  for (var m = start; m < end; m++) {
                    tempdataH.add(twoDArray[l][m]);
                  }
                }
              }

              //swapping
              if (tempdatav.isNotEmpty && tempdataH.isEmpty) {
                if (tempdatav.indexWhere((idx) => idx == currData) == -1) {
                  //currdata
                  if (currdatav.isNotEmpty && currdataH.isEmpty) {
                    if (currdatav.indexWhere((idx) => idx == twoDArray[i][r]) ==
                        -1) {
                      twoDArray[i][j] = twoDArray[i][r];
                      twoDArray[i][r] = currData;
                      break;
                    }
                  } else if (currdatav.isNotEmpty && currdataH.isNotEmpty) {
                    if (currdatav.indexWhere((idx) => idx == twoDArray[i][r]) ==
                            -1 &&
                        currdataH.indexWhere((idx) => idx == twoDArray[i][r]) ==
                            -1) {
                      twoDArray[i][j] = twoDArray[i][r];
                      twoDArray[i][r] = currData;
                      break;
                    }
                  }
                  //end
                }
              } else if (tempdatav.isNotEmpty && tempdataH.isEmpty) {
                if (tempdatav.indexWhere((idx) => idx == currData) == -1 &&
                    tempdataH.indexWhere((idx) => idx == currData) == -1) {
                  //currdata
                  if (currdatav.isNotEmpty && currdataH.isEmpty) {
                    if (currdatav.indexWhere((idx) => idx == twoDArray[i][r]) ==
                        -1) {
                      twoDArray[i][j] = twoDArray[i][r];
                      twoDArray[i][r] = currData;
                      break;
                    }
                  } else if (currdatav.isNotEmpty && currdataH.isNotEmpty) {
                    if (currdatav.indexWhere((idx) => idx == twoDArray[i][r]) ==
                            -1 &&
                        currdataH.indexWhere((idx) => idx == twoDArray[i][r]) ==
                            -1) {
                      twoDArray[i][j] = twoDArray[i][r];
                      twoDArray[i][r] = currData;
                      break;
                    }
                  }
                  //end
                }
              }
            }
          }
        }
      }
    }
  }

  checker(List<List<int>> arr) {
    var ctr = 0;
    var summst = 0;
    for (var i = 0; i < lengthCol; i++) {
      summst = summst + (i + 1);
    }
    var sum = 0;
    for (var i = 0; i < lengthCol; i++) {
      sum = 0;
      for (var k = 0; k < lengthCol; k++) {
        sum = sum + arr[k][i];
      }
      if (sum != summst) {
        ctr = -1;
        break;
      }
    }
    if (ctr == 0) {
      scramblingdone = 1;
    }
  }

  int getRandomNumberInRangeExcept(int min, int max, int exclude) {
    Random random = Random();
    int randomNumber;

    do {
      randomNumber = min + random.nextInt(max + 1 - min);
    } while (randomNumber == exclude);

    return randomNumber;
  }
}
