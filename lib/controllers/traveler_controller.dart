import 'package:get/get.dart';

class ClassTravelerController extends GetxController {
  String classes = 'Economy';
  Map<String, int> travelers = {
    'adults': 0,
    'senior': 0,
    'youth': 0,
    'child': 0,
    'seat_infant_under': 0,
  };
  int numTravelers = 0;
  bool isSelected = false;
  void onChangedClasses(String classes) {
    this.classes = classes;
    update(['classes']);
  }

  void onChangedTraveler({String type, int travelerNumber}) {
    travelers[type] = travelerNumber;
    update(['travelers']);
  }
}
