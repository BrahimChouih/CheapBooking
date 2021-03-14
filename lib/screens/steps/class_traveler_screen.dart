import 'package:cheap_booking/controllers/traveler_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassTravelerScreen extends StatelessWidget {
  final classTravelerController = Get.find<ClassTravelerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff405064),
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Class & Traveler',
          style: TextStyle(
            color: Get.theme.primaryColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          GetBuilder<ClassTravelerController>(
            id: 'classes',
            builder: (_) => Column(
              children: [
                SizedBox(height: Get.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    classes('Economy'),
                    classes('Pro Economy'),
                  ],
                ),
                SizedBox(height: Get.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    classes('Business'),
                    classes('First Class'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget classes(String txt) {
    bool isSelected = classTravelerController.classes == txt;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => classTravelerController.onChangedClasses(txt),
      child: Container(
        child: Text(
          txt,
          style: TextStyle(
            color: isSelected ? Colors.white : null,
          ),
        ),
        alignment: Alignment.center,
        width: 130,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff00D8CB) : Color(0xffEDF2F8),
          border: !isSelected ? Border.all(color: Color(0xffCAD0D6)) : null,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Color(0xff00D8CB),
                    blurRadius: 20,
                    spreadRadius: -5,
                  )
                ]
              : null,
        ),
      ),
    );
  }
}
