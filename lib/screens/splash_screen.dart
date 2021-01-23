import 'package:cheap_booking/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  static const id = 'SplashScreen';

  void loadingData() async {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAndToNamed(InfoScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    loadingData();
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.5,
            alignment: Alignment.center,
            child: Text(
              'Cheap Booking',
              style: TextStyle(
                color: Color(0xff00D0DF),
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
