import 'package:cheap_booking/components/submit_button.dart';
import 'package:cheap_booking/controllers/step_controller.dart';
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
          SizedBox(height: Get.height * 0.05),
          GetBuilder<ClassTravelerController>(
            id: 'travelers',
            builder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                travelers(txt: 'Adults 18-64', type: 'adults'),
                travelers(txt: 'Senior 65+', type: 'senior'),
                travelers(txt: 'Youth 12-17', type: 'youth'),
                travelers(txt: 'Child 2-11', type: 'child'),
                travelers(
                  txt: 'Seat Infant Under 2',
                  type: 'seat_infant_under',
                ),
              ],
            ),
          ),
          SizedBox(height: Get.height * 0.05),
          SubmitButton(onTap: () {
            classTravelerController.isSelected = true;
            Get.back();
          }),
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

  Widget travelers({String txt, String type}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          plusMinusButton('+', type),
          Column(
            children: [
              Text(
                classTravelerController.travelers[type].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(txt, style: TextStyle(color: Color(0xff7E7C85))),
            ],
          ),
          plusMinusButton('-', type),
        ],
      ),
    );
  }

  Widget plusMinusButton(String pm, String type) {
    return InkWell(
      onTap: () {
        int traveler = classTravelerController.travelers[type];
        if (pm == "+") {
          traveler++;
          classTravelerController.numTravelers++;
        } else if (traveler > 0) {
          traveler--;
          classTravelerController.numTravelers--;
        }
        classTravelerController.onChangedTraveler(
          type: type,
          travelerNumber: traveler,
        );
      },
      child: Container(
        child: Icon(
          pm == '+' ? Icons.add : Icons.remove,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          color: Color(0xffEDF2F8),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
