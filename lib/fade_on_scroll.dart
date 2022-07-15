import 'package:barktest/controller/appbar_controller.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeOnScroll extends GetView<AppbarController> {
  @override
  final controller = Get.put(AppbarController());
  late AnimationController animationController;
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  double pageOffset = 0;
  var scroll = ScrollController();
  List assetImageList = [];

  @override
  Widget build(BuildContext context) {
    scroll.addListener(() {
      controller.getColor(scroll.position.pixels);
    });
    return Scaffold(
      body: CustomScrollView(
        controller: scroll,
        slivers: [
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
                      color:
                          controller.changedColor ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
              expandedHeight: 450,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background:
                    //  CarouselImages(
                    //   viewportFraction: 1.0,
                    //   borderRadius: 0,
                    //   cachedNetworkImage: true,
                    //   listImages: [
                    //     'assets/test04.jpg',
                    //     'assets/test05.jpg',
                    //   ],
                    //   height: 500,
                    // )
                    CarouselSlider(
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
          SliverFillRemaining(
            fillOverscroll: true,
            child: SafeArea(
              minimum: EdgeInsets.only(top: 40),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('사료'),
                        Text('간식'),
                        Text('장난감'),
                        Text('산책용품'),
                        Text('목욕')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
