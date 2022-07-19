// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:barktest/detail/pages/detail_page.dart';
import 'package:barktest/home/controller/appbar_controller.dart';
import 'package:barktest/home/controller/home_tab_controller.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomePage extends GetView<AppbarController> {
  @override
  final controller = Get.put(AppbarController());
  final tabController = Get.put(HomeTabController());
  late AnimationController animationController;
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  double pageOffset = 0;
  var scroll = ScrollController();
  List assetImageList = [];

  @override
  Widget build(BuildContext context) {
    // 스크롤
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight = statusBarHeight + kToolbarHeight;
    scroll.addListener(() {
      controller.getColor(scroll.position.pixels);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: ExtendedNestedScrollView(
        pinnedHeaderSliverHeightBuilder: () {
          return statusBarHeight;
        },
        onlyOneScrollInBody: true,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                alignment: Alignment.center,
                height: 40,
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.black26,
                  labelPadding: EdgeInsets.zero,
                  labelColor: Colors.black87,
                  tabs: tabController.myTabs,
                  controller: tabController.controller,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: tabController.controller,
                    children: [
                      // 상품 리스트 탭
                      GridView.builder(
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 3 / 5),
                          itemBuilder: (BuildContext context, int index) {
                            return Product(
                              image: item[index],
                              detail: () => Get.to(itemOnTap[index]),
                            );
                          }),
                      Text('간식 상세'),
                      Text('장난감 상세'),
                      Text('산책용품 상세'),
                      Text('목욕 상세'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        controller: scroll,
        headerSliverBuilder: (context, index) {
          return [
            Obx(() => SliverAppBar(
                toolbarHeight: 50,
                collapsedHeight: 60,
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.search,
                          color: controller.changedColor
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_active_outlined,
                          color: controller.changedColor
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: controller.changedColor
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
                expandedHeight: 450,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: CarouselSlider(
                      items: [
                        Image.asset(
                          'assets/test04.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/test05.jpg',
                          fit: BoxFit.cover,
                        ),
                      ],
                      options: CarouselOptions(
                          pauseAutoPlayInFiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 600),
                          initialPage: 1,
                          autoPlay: true,
                          viewportFraction: 1,
                          height: 500)),
                ))),
          ];
        },
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    Key? key,
    this.image = '',
    required this.detail,
  }) : super(key: key);

  final String image;
  final Function() detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: detail,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.contain)),
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.width * .5,
          ),
        ),
        // 제목 영역
        Container(
          width: MediaQuery.of(context).size.width * .5,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // 타이틀
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '오리젠 오리지날',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.black45,
                    size: 17,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  '[340g 증정] 오리젠 오리지날 독 11.4kg',
                  style:
                      TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12),
                ),
              ),
              // 가격
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: Text(
                      '5%',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    '132,000원',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 13,
                          color: Colors.black26,
                        ),
                        Text('1,300',
                            style:
                                TextStyle(color: Colors.black26, fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.black26,
                        ),
                        Text('4.5(500)',
                            style:
                                TextStyle(color: Colors.black26, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

List<String> item = [
  'assets/product01.jpeg',
  'assets/product02.jpeg',
  'assets/product03.jpeg',
  'assets/product04.jpeg'
];

List itemOnTap = [
  DetailPage(),
  DetailPage(),
  DetailPage(),
  DetailPage(),
];
