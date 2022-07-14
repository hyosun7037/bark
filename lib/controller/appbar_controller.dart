import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AppbarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static AppbarController get to => Get.find();
  var logger = Logger();
  // 스크롤 위치
  late AnimationController animationController;
  var scroll = ScrollController();
  final RxBool _changedColor = false.obs;

  @override
  void onInit() {
    super.onInit();
    scroll.addListener(() {
      print('실행');
      logger.d(scroll.position.pixels);
      final changedColor = scroll.position.pixels > 336 ? true : false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getColor(scrollPositionPixels) async {
    if (scrollPositionPixels > 336) {
      _changedColor.value = true;
    } else {
      _changedColor.value = false;
    }
  }

  bool get changedColor => _changedColor.value;
}
