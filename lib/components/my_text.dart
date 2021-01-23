import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyText extends StatelessWidget {
  final String txt;
  final bool isTitle;
  final Color color;
  MyText(
    this.txt, {
    this.isTitle = false,
    this.color = Colors.black,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Text(
        txt,
        style: TextStyle(
          fontSize: isTitle ? 24 : null,
          fontWeight: isTitle ? FontWeight.bold : null,
          color: color,
        ),
      ),
    );
  }
}
