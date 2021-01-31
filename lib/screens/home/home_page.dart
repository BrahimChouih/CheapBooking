import 'package:cheap_booking/components/my_text.dart';
import 'package:cheap_booking/screens/steps/search_destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final String titleFHC;
  TextEditingController destController = TextEditingController();

  HomePage({this.titleFHC});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        margin: EdgeInsets.only(top: Get.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            destinationCard(),
            SizedBox(height: Get.height * 0.04),
            Text(
              'Popular Destination',
              style: TextStyle(color: Color(0xffC7CFD8)),
            ),
            SizedBox(height: Get.height * 0.02),
            cityCardBuilder(),
          ],
        ),
      ),
    );
  }

  Widget cityCardBuilder() {
    List cities = [
      {'cityName': 'Dhaka', 'image': 'dhaka.png'},
      {'cityName': 'Maldives', 'image': 'maldives.png'},
      {'cityName': 'Jeddah', 'image': 'jeddah.png'},
      {'cityName': 'Dhaka', 'image': 'photo.png'},
      {'cityName': 'Dhaka', 'image': 'dhaka.png'},
      {'cityName': 'Jeddah', 'image': 'jeddah.png'},
      {'cityName': 'Dhaka', 'image': 'photo.png'},
    ];
    if (titleFHC == 'hotel') {
      cities = cities.reversed.toList();
    }
    List<Widget> children = [];
    int j = -1;
    for (int i = 0; i < cities.length / 2; i++) {
      List<Widget> rowChild = [];
      j++;
      rowChild.add(cityCard(
        cityName: cities[j]['cityName'],
        image: cities[j]['image'],
      ));
      j++;
      try {
        rowChild.add(cityCard(
          cityName: cities[j]['cityName'],
          image: cities[j]['image'],
        ));
      } catch (e) {
        rowChild.add(Expanded(child: Container()));
      }

      children.add(
        Row(children: rowChild),
      );
    }
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (_, i) => children[i],
      shrinkWrap: true,
      primary: false,
    );
  }

  Widget cityCard({String cityName, String image}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            Image.asset('assets/cities/$image'),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                  top: Get.height * 0.11,
                ),
                // height: 80,
                width: Get.width * 0.35,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 14,
                      spreadRadius: -8,
                      color: Colors.grey,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cityName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '20 $titleFHC available Start from \$210',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff707070),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget destinationCard() {
    return Container(
      height: 180,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: -14,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset('assets/images/dest.svg'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text('Medea'),
                width: Get.width * 0.7,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  onTap: () {
                    Get.toNamed(
                      SearchDestination.id,
                      arguments: [destController.text],
                    );
                  },
                  controller: destController,
                  onChanged: (value) => Get.toNamed(
                    SearchDestination.id,
                    arguments: [destController.text],
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Enter Destination',
                  ),
                ),
                width: Get.width * 0.7,
                height: Get.height * 0.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
              ),
            ],
          ),
          SvgPicture.asset('assets/icons/change.svg')
        ],
      ),
    );
  }
}
