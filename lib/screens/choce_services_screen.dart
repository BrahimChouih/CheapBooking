import 'package:cheap_booking/components/my_text.dart';
import 'package:cheap_booking/components/services_cards.dart';
import 'package:cheap_booking/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get/get.dart';

class ChoseServicesScreen extends StatelessWidget {
  static const id = 'ChoseServicesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.08),
            MyText('Welcome to Cheap Booking', isTitle: true),
            SizedBox(height: Get.height * 0.03),
            MyText('Please select waht you want'),
            SizedBox(height: Get.height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
              child: Row(children: [
                ServicesCard(
                  colorGradient: [
                    Color(0xff00EFDF),
                    Color(0xff00C4F8),
                  ],
                  image: 'plane_card.svg',
                  title: 'Flight',
                  subtitle: '2000 flights',
                  onTap: () => Get.toNamed(HomeScreen.id, arguments: 0),
                ),
                ServicesCard(
                  colorGradient: [
                    Color(0xffF3E79A),
                    Color(0xffC5A716),
                  ],
                  image: 'hotel_card.svg',
                  title: 'Hotel',
                  subtitle: '2000 hotel',
                  onTap: () => Get.toNamed(HomeScreen.id, arguments: 1),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
              child: Row(children: [
                ServicesCard(
                  colorGradient: [
                    Color(0xff81F5BB),
                    Color(0xff02C59E),
                  ],
                  image: 'car_card.svg',
                  title: 'Car',
                  subtitle: '2000 car',
                  onTap: () => Get.toNamed(HomeScreen.id, arguments: 2),
                ),
                ServicesCard(
                  colorGradient: [
                    Color(0xffEAB2F5),
                    Color(0xff9E6FF1),
                  ],
                  image: 'super_deal.svg',
                  title: 'SuperDeal',
                  onTap: () => print('Super Deal'),
                ),
              ]),
            ),
            SizedBox(height: Get.height * 0.03),
            InkWell(
              onTap: () => print('GET FESTIVAL OFF 30%'),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                decoration: BoxDecoration(
                  color: Color(0xffFFD821),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffFFD821),
                      spreadRadius: -8,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Image.asset('assets/images/get_f_off.png'),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
          ],
        ),
      ),
    );
  }
}
