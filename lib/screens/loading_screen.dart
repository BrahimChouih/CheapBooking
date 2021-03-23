import 'package:cheap_booking/screens/choce_services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatelessWidget {
  RxBool isDone = false.obs;
  void loading(bool value) async {
    Future.delayed(Duration(seconds: 2), () {
      isDone.value = value;
    });
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed(ChoseServicesScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    loading(true);
    return Scaffold(
      backgroundColor: Color(0xffCCEAF7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/loading/plane4.gif'),
          Obx(
            () => Text(
              !isDone.value ? 'Loading ...' : 'Is Done',
              style: TextStyle(
                color: Color(0xff00D0DF),
                fontSize: 30,
              ),
            ),
          ),
          SvgPicture.asset('assets/loading/city.svg'),
        ],
      ),
    );
  }
}
