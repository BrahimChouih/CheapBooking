import 'package:cheap_booking/screens/steps_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDestination extends StatelessWidget {
  static const id = 'SearchDestination';
  TextEditingController destController =
      TextEditingController(text: Get.arguments[0]);

  List<String> destinations = [
    'Dhaka (DAC)',
    'Chittagram (CHT)',
    'Jeddah (JED)',
    'Ryad (RAD)',
    'Madina (MAD)',
    'Jeddah (JED)',
    'Ryad (RAD)',
    'Jeddah (JED)',
    'Ryad (RAD)',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        centerTitle: true,
        shadowColor: Color(0xff0E141D).withOpacity(0.3),
        elevation: 15,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff405064),
          ),
        ),
        title: TextField(
          controller: destController,
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'Where to',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(destinations[i]),
          onTap: () => Get.toNamed(
            StepsScreen.id,
            arguments: [destinations[i]],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('\$320', style: TextStyle(color: Colors.grey)),
              SizedBox(width: Get.width * 0.035),
              Text('.', style: TextStyle(color: Colors.grey)),
              SizedBox(width: Get.width * 0.035),
              Text('2h 25min', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
