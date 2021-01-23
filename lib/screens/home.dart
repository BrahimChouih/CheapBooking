import 'package:cheap_booking/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;

  RxInt currentTab = 0.obs;

  @override
  void initState() {
    currentTab.value = Get.arguments;
    pageController = PageController(initialPage: Get.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (_) => GestureDetector(
                    child: Image.asset(
                      'assets/icons/drawer.png',
                      // width: Get.width * 0.02,
                    ),
                    onTap: () {
                      Scaffold.of(_).openDrawer();
                    },
                  ),
                ),
                Obx(
                  () => Row(
                    children: [
                      tapIcon(iconStr: 'plane.svg', page: 0, txt: 'Flight'),
                      tapIcon(iconStr: 'bed.svg', page: 1, txt: 'Hotel'),
                      tapIcon(iconStr: 'car.svg', page: 2, txt: 'Car'),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  HomePage(titleFHC: 'flight'),
                  HomePage(titleFHC: 'hotel'),
                  HomePage(titleFHC: 'car'),
                ],
                onPageChanged: (index) {
                  currentTab.value = index;
                  currentTab.refresh();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tapIcon({
    String txt,
    String iconStr,
    int page,
  }) {
    bool isActive = currentTab.value == page;
    Color color = isActive ? Color(0xff00C6EB) : Colors.grey;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        pageController.animateToPage(
          page,
          curve: Curves.linear,
          duration: Duration(milliseconds: 200),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Get.width * 0.04,
        ),
        height: Get.height * 0.07,
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/$iconStr',
              // width: Get.width * 0.011,
              color: color,
            ),
            SizedBox(width: Get.width * 0.01),
            Text(
              txt,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
