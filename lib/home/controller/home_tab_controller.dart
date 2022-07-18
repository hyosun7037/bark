import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomeTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static HomeTabController get to => Get.find();
  var logger = Logger();
  late TabController controller;

  final RxInt _pageIndex = 1.obs;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: '사료'),
    const Tab(text: '간식'),
    const Tab(text: '장난감'),
    const Tab(text: '산책용품'),
    const Tab(text: '목욕'),
  ];

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  int get pageIndex => _pageIndex.value;
}
