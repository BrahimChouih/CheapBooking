import 'package:cheap_booking/screens/choce_services_screen.dart';
import 'package:cheap_booking/screens/page_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoScreen extends StatelessWidget {
  static const id = 'InfoScreen';
  PageController pageController = PageController();
  var currentPage = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Get.height * 0.9,
            child: PageView(
              controller: pageController,
              children: [
                PageInfo(
                  image: 'page1.svg',
                  title: 'Book Cheapest Flight',
                  content:
                      'We compare prices from 200+ booking site to help you find the lowest price ',
                ),
                PageInfo(
                  image: 'page2.svg',
                  title: 'Reliable Transport',
                  content:
                      'We compare prices from 200+ booking site to help you find the lowest price ',
                ),
                page3(),
              ],
              onPageChanged: (value) {
                currentPage.value = value;
                if (value == 2) {
                  Get.offAndToNamed(ChoseServicesScreen.id);
                }
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: Get.width * 0.05),
                      stepInfo(0 == currentPage.value),
                      stepInfo(1 == currentPage.value),
                      stepInfo(2 == currentPage.value),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.offAndToNamed(ChoseServicesScreen.id);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Color(0xff18ABF1)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget stepInfo(bool isCurrent) {
    return Container(
      margin: EdgeInsets.only(right: Get.width * 0.01),
      child: Image.asset(
          'assets/icons/${isCurrent ? "current_step" : "step"}.png'),
    );
  }

  Widget page3() {
    return Container();
  }
}
