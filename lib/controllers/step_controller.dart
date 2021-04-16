import 'package:get/get.dart';

class StepController extends GetxController {
  int currentStep = 3;
  String classes = 'Economy';
  int traveler = 0;
  void onChanged(int newStep) {
    currentStep = newStep;
    update();
  }

  void onChangerdClassesAndTraveler({
    String classes,
    int traveler,
  }) {
    this.classes = classes;
    this.traveler = traveler;
    update();
  }
}
