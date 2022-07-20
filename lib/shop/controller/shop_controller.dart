import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ShopController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static ShopController get to => Get.find();
  var logger = Logger();
  late TabController controller;

  final RxInt _pageIndex = 1.obs;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: '사료'),
    const Tab(text: '간식'),
    const Tab(text: '영양제'),
    const Tab(text: '산책아웃도어'),
    const Tab(text: '장난감'),
    const Tab(text: '목욕위생'),
  ];

  // pageView
  RxInt _selectedIndex = 0.obs;
  PageController _pageController = PageController();
  int _pageCount = 6;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> verticalTabs(index) async {
    _selectedIndex.value = index;
    _pageController.jumpToPage(index);
  }

  int get pageIndex => _pageIndex.value;
  int get selectedIndex => _selectedIndex.value;
}
