import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/controller/snakeGamecontroller.dart';
import 'package:get/get.dart';

import '../model/const.dart';

class Sudokuboard extends StatelessWidget {
  Sudokuboard({super.key});
  final SnakeGameController _controller = Get.put(SnakeGameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Obx(
            () => _controller.donegenerate.value == 0
                ? const SizedBox()
                : Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: [
                            for (var j = 0;
                                j < _controller.sudokunumber.length;
                                j++)
                              Row(
                                children: [
                                  for (var m = 0;
                                      m < _controller.sudokunumber.length;
                                      m++)
                                    getfield(context, j, m)
                                ],
                              ),
                          ],
                        )),
                  ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(
          //     onTap: () {
          //       _controller.gethiddenlist();
          //     },
          //     child: Container(
          //       color: Colors.black,
          //       child: const Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Text(
          //           "scrambled",
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget getfield(BuildContext context, int j, int m) {
    return InkWell(
      onTap: () {
        _controller.sudokunumberhide[j][m] = 1;
        _controller.donegenerate.value = 0;
        _controller.donegenerate.value = 1;
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: j == _controller.sudokunumber.length - 1 && m == 2
                ? Border(
                    bottom: BorderSide(
                      color: lines, // Set the color of the right border
                      width: 3.0, // Set the width of the right border
                    ),
                    right: BorderSide(
                      color: lines, // Set the color of the right border
                      width: 3.0, // Set the width of the right border
                    ),
                  )
                : j % 2 == 1 && m == 2
                    ? Border(
                        right: BorderSide(
                          color: lines, // Set the color of the right border
                          width: 3.0, // Set the width of the right border
                        ),
                      )
                    : m == 2 && j % 2 == 0
                        ? Border(
                            top: BorderSide(
                              color: lines, // Set the color of the right border
                              width: 3.0, // Set the width of the right border
                            ),
                            right: BorderSide(
                              color: lines, // Set the color of the right border
                              width: 3.0, // Set the width of the right border
                            ),
                          )
                        : m == 2 && j == 0
                            ? Border(
                                top: BorderSide(
                                  color:
                                      lines, // Set the color of the right border
                                  width:
                                      3.0, // Set the width of the right border
                                ),
                                right: BorderSide(
                                  color:
                                      lines, // Set the color of the right border
                                  width:
                                      3.0, // Set the width of the right border
                                ),
                              )
                            : j % 2 == 0 && m == 0
                                ? Border(
                                    top: BorderSide(
                                      color:
                                          lines, // Set the color of the right border
                                      width:
                                          3.0, // Set the width of the right border
                                    ),
                                    left: BorderSide(
                                      color:
                                          lines, // Set the color of the right border
                                      width:
                                          3.0, // Set the width of the right border
                                    ),
                                  )
                                : j % 2 == 0 &&
                                        m == _controller.sudokunumber.length - 1
                                    ? Border(
                                        top: BorderSide(
                                          color:
                                              lines, // Set the color of the right border
                                          width:
                                              3.0, // Set the width of the right border
                                        ),
                                        right: BorderSide(
                                          color:
                                              lines, // Set the color of the right border
                                          width:
                                              3.0, // Set the width of the right border
                                        ),
                                      )
                                    : j % 2 == 0
                                        ? Border(
                                            top: BorderSide(
                                              color:
                                                  lines, // Set the color of the right border
                                              width:
                                                  3.0, // Set the width of the right border
                                            ),
                                          )
                                        : j ==
                                                    _controller.sudokunumber
                                                            .length -
                                                        1 &&
                                                m ==
                                                    _controller.sudokunumber
                                                            .length -
                                                        1
                                            ? Border(
                                                right: BorderSide(
                                                  color:
                                                      lines, // Set the color of the right border
                                                  width:
                                                      3.0, // Set the width of the right border
                                                ),
                                                bottom: BorderSide(
                                                  color:
                                                      lines, // Set the color of the right border
                                                  width:
                                                      3.0, // Set the width of the right border
                                                ),
                                              )
                                            : j ==
                                                        _controller.sudokunumber
                                                                .length -
                                                            1 &&
                                                    m == 0
                                                ? Border(
                                                    left: BorderSide(
                                                      color:
                                                          lines, // Set the color of the right border
                                                      width:
                                                          3.0, // Set the width of the right border
                                                    ),
                                                    bottom: BorderSide(
                                                      color:
                                                          lines, // Set the color of the right border
                                                      width:
                                                          3.0, // Set the width of the right border
                                                    ),
                                                  )
                                                : j == 0 &&
                                                        m ==
                                                            _controller
                                                                    .sudokunumber
                                                                    .length -
                                                                1
                                                    ? Border(
                                                        top: BorderSide(
                                                          color:
                                                              lines, // Set the color of the right border
                                                          width:
                                                              3.0, // Set the width of the right border
                                                        ),
                                                        right: BorderSide(
                                                          color:
                                                              lines, // Set the color of the right border
                                                          width:
                                                              3.0, // Set the width of the right border
                                                        ),
                                                      )
                                                    : j == 0 && m == 0
                                                        ? Border(
                                                            top: BorderSide(
                                                              color:
                                                                  lines, // Set the color of the right border
                                                              width:
                                                                  3.0, // Set the width of the right border
                                                            ),
                                                            left: BorderSide(
                                                              color:
                                                                  lines, // Set the color of the right border
                                                              width:
                                                                  3.0, // Set the width of the right border
                                                            ),
                                                          )
                                                        : j == 0
                                                            ? Border(
                                                                top: BorderSide(
                                                                  color:
                                                                      lines, // Set the color of the right border
                                                                  width:
                                                                      3.0, // Set the width of the right border
                                                                ),
                                                              )
                                                            : j ==
                                                                    _controller
                                                                            .sudokunumber
                                                                            .length -
                                                                        1
                                                                ? Border(
                                                                    bottom:
                                                                        BorderSide(
                                                                      color:
                                                                          lines, // Set the color of the right border
                                                                      width:
                                                                          3.0, // Set the width of the right border
                                                                    ),
                                                                  )
                                                                : m == 0
                                                                    ? Border(
                                                                        left:
                                                                            BorderSide(
                                                                          color:
                                                                              lines, // Set the color of the right border
                                                                          width:
                                                                              3.0, // Set the width of the right border
                                                                        ),
                                                                      )
                                                                    : m == _controller.sudokunumber.length - 1
                                                                        ? Border(
                                                                            right:
                                                                                BorderSide(
                                                                              color: lines, // Set the color of the right border
                                                                              width: 3.0, // Set the width of the right border
                                                                            ),
                                                                          )
                                                                        : const Border()),
        width: (MediaQuery.of(context).size.width * 0.8) / 6,
        height: 50,
        child: Center(
          child: Text(_controller.sudokunumber[j][m].toString(),
              style: TextStyle(
                  color: _controller.sudokunumberhide[j][m] == 0
                      ? Colors.grey.shade50
                      : Colors.black)),
        ),
      ),
    );
  }
}
