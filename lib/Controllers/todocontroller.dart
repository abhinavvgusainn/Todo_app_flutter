import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
   
  RxString newString = ''.obs;
  void changeTheme() {
    Get.changeTheme(
      Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
    );
  }
}
