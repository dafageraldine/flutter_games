import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/controller/snakeGamecontroller.dart';
import 'package:games/game/snakeGame.dart';
import 'package:get/get.dart';

class Dashoard extends StatelessWidget {
  Dashoard({super.key});
  final SnakeGameController _controller = Get.put(SnakeGameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.2.sw, right: 0.2.sw, top: 0.2.sh),
            child: Center(
              child: InkWell(
                onTap: () {
                  Get.to(snakeGame());
                },
                child: Container(
                  color: Colors.teal.shade500,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Ular Tangga',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.2.sw, right: 0.2.sw, top: 0.02.sh),
            child: Center(
              child: InkWell(
                onTap: () {
                  _controller.generateRowNumber();
                },
                child: Container(
                  color: Colors.teal.shade500,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Sudoku',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
