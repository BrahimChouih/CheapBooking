import 'dart:ui';

import 'package:cheap_booking/components/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ServicesCard extends StatelessWidget {
  ServicesCard({
    this.image,
    this.title,
    this.subtitle = '',
    this.colorGradient,
    this.onTap,
  });

  final Function onTap;
  final String title;
  final String subtitle;
  final List<Color> colorGradient;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: Get.height * 0.25,
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03,
            vertical: Get.height * 0.02,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colorGradient,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: colorGradient[1],
                spreadRadius: -12,
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/${image}',
                // scale: Get.width / 300,
              ),
              MyText(title, isTitle: true, color: Colors.white),
              MyText(subtitle, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
