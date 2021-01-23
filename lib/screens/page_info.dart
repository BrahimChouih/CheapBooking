import 'package:cheap_booking/components/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PageInfo extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  PageInfo({this.image, this.title, this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              child: SvgPicture.asset('assets/images/$image'),
            ),
          ),
          MyText(title, isTitle: true),
          SizedBox(height: Get.height * 0.04),
          MyText(content),
          SizedBox(height: Get.height * 0.1),
        ],
      ),
    );
  }
}
