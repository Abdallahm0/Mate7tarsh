import 'package:get/get.dart';
import 'package:mate7tarsh/model/test_modle.dart';

class FoodControllers extends GetxController {
  var lunchList = <TestModle>[].obs;

  void updateLunchList(List<TestModle> restaurants) {
    lunchList.assignAll(restaurants);
  }
}
