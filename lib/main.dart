import 'package:cheap_booking/screens/choce_services_screen.dart';
import 'package:cheap_booking/screens/home.dart';
import 'package:cheap_booking/screens/info_screen.dart';
import 'package:cheap_booking/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cheap Booking App',
      initialRoute: SplashScreen.id,
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xff00D0DF),
        scaffoldBackgroundColor: Color(0xffEEFDFF),
      ),
      getPages: [
        GetPage(name: SplashScreen.id, page: () => SplashScreen()),
        GetPage(name: InfoScreen.id, page: () => InfoScreen()),
        GetPage(
            name: ChoseServicesScreen.id, page: () => ChoseServicesScreen()),
        GetPage(name: HomeScreen.id, page: () => HomeScreen()),
      ],
    );
  }
}
