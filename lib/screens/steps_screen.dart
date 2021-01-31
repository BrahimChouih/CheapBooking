import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StepsScreen extends StatelessWidget {
  static const id = 'StepsScreen';
  final Color colorActive = Color(0xff00D7FF);
  String destination = Get.arguments[0];
  final stepController = Get.put(StepController());
  DateTime dateDepature;
  DateTime dateArival;

  Rx<TypeTrip> _typeTrip = TypeTrip.none.obs;
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
          'Search Flight',
          style: TextStyle(
            color: Get.theme.primaryColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 400,
            child: Row(
              children: [
                SizedBox(width: 20),
                GetBuilder<StepController>(
                  builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      SvgPicture.asset(
                        'assets/icons/location.svg',
                        color: colorActive,
                      ),
                      customizeVerticalDivider(colorActive),
                      SvgPicture.asset(
                        'assets/icons/destination.svg',
                        color: colorActive,
                      ),
                      customizeVerticalDivider(colorActive),
                      SvgPicture.asset(
                        'assets/icons/send-mail.svg',
                        color: stepController.currentStep > 3
                            ? colorActive
                            : Colors.grey,
                      ),
                      customizeVerticalDivider(stepController.currentStep > 3
                          ? colorActive
                          : Colors.grey),
                      SvgPicture.asset(
                        'assets/icons/calender.svg',
                        color: stepController.currentStep > 4
                            ? colorActive
                            : Colors.grey,
                      ),
                      customizeVerticalDivider(stepController.currentStep > 4
                          ? colorActive
                          : Colors.grey),
                      SvgPicture.asset(
                        'assets/icons/baby.svg',
                        color: stepController.currentStep > 5
                            ? colorActive
                            : Colors.grey,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                GetBuilder<StepController>(
                  builder: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text('Medea'),
                        width: Get.width * 0.75,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorActive),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(destination),
                        width: Get.width * 0.75,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorActive),
                        ),
                      ),
                      Container(
                        width: Get.width * 0.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            typeTrip(
                              'One Way',
                              _typeTrip.value == TypeTrip.oneWay,
                              TypeTrip.oneWay,
                            ),
                            typeTrip(
                              'Round Trip',
                              _typeTrip.value == TypeTrip.roundTrip,
                              TypeTrip.roundTrip,
                            ),
                            typeTrip(
                              'Multi City',
                              _typeTrip.value == TypeTrip.multiCity,
                              TypeTrip.multiCity,
                            ),
                          ],
                        ),
                      ),
                      stepController.currentStep >= 4
                          ? selectTime()
                          : SizedBox(height: 55),
                      SizedBox(height: 55),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customizeVerticalDivider(Color color) {
    return Expanded(
      child: Container(
        child: VerticalDivider(
          color: color,
          thickness: 2,
        ),
      ),
    );
  }

  Widget typeTrip(String txt, bool isSelected, TypeTrip _typeTrip) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        this._typeTrip.value = _typeTrip;
        if (stepController.currentStep == 3) {
          stepController.onChanged(4);
        }
        stepController.update();
        print(stepController.currentStep);
      },
      child: Container(
        child: Text(
          txt,
          style: TextStyle(
            color: isSelected ? Colors.white : null,
          ),
        ),
        alignment: Alignment.center,
        width: 80,
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

  Widget selectTime() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              dateDepature = await showDatePicker(
                context: Get.context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(dateArival.year, dateArival.month,
                        dateArival.day - 1) ??
                    DateTime(DateTime.now().year + 1),
              );
              if (dateDepature != null &&
                  dateArival != null &&
                  stepController.currentStep == 4) {
                stepController.onChanged(5);
              }
              stepController.update();
            },
            child: Container(
              width: Get.width * 0.357,
              height: 55,
              alignment: Alignment.center,
              child: Text(
                dateDepature == null
                    ? '1 Jun 2021'
                    : dateDepature.toString().substring(0, 10),
                style: TextStyle(
                  color: dateDepature == null ? Colors.grey : null,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              dateArival = await showDatePicker(
                context: Get.context,
                initialDate: dateDepature ?? DateTime.now(),
                firstDate: dateDepature ?? DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 1),
              );
              if (dateDepature != null &&
                  dateArival != null &&
                  stepController.currentStep == 4) {
                stepController.onChanged(5);
              }
              stepController.update();
            },
            child: Container(
              width: Get.width * 0.357,
              height: 55,
              alignment: Alignment.center,
              child: Text(
                dateArival == null
                    ? '1 Jun 2021'
                    : dateArival.toString().substring(0, 10),
                style: TextStyle(
                  color: dateArival == null ? Colors.grey : null,
                ),
              ),
            ),
          ),
        ],
      ),
      width: Get.width * 0.75,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: stepController.currentStep == 4 ? Colors.grey : colorActive,
        ),
      ),
    );
  }
}

enum TypeTrip {
  oneWay,
  roundTrip,
  multiCity,
  none,
}

class StepController extends GetxController {
  int currentStep = 3;
  void onChanged(int newStep) {
    currentStep = newStep;
    update();
  }
}
