import 'package:barktest/controller/appbar_controller.dart';
import 'package:barktest/item_list.dart';
import 'package:barktest/sliding_cards_view.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class FadeOnScroll extends GetView<AppbarController> {
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
      precacheImage(Image.asset('assets/meta.jpg').image, context);
      precacheImage(Image.asset('assets/test01.jpg').image, context);
      precacheImage(Image.asset('assets/test02.jpg').image, context);
    });
    // 테스트
    // assetImageList = [
    //   Image.asset('assets/meta.jpg').image,
    //   Image.asset('assets/test01.jpg').image,
    //   Image.asset('assets/test02.jpg').image
    // ];
    assetImageList = [
      'assets/meta.jpg',
      'assets/test01.jpg',
      'assets/test02.jpg'
    ];
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
                background: Swiper(
                  autoplay: true,
                  autoplayDisableOnInteraction: false,
                  axisDirection: AxisDirection.right,
                  itemWidth: MediaQuery.of(context).size.width,
                  layout: SwiperLayout.STACK,
                  itemCount: demo.length,
                  itemBuilder: (BuildContext context, int index) {
                    final image = assetImageList[index];
                    return Image.asset(
                      image,
                      fit: BoxFit.cover,
                    );
                    // return SlidingCard(
                    //   name: '',
                    //   date: '',
                    //   image: assetImageList[index],
                    //   offset: pageOffset,
                    // );
                  },
                ),
              )
              // FlexibleSpaceBar(
              //     background: PageView.builder(
              //         pageSnapping: true,
              //         controller: pageController,
              //         itemCount: demo.length,
              //         onPageChanged: (value) {},
              //         itemBuilder: (context, index) {
              //           return SlidingCard(
              //             name: '브랜드 즐겨찾기$index',
              //             date: '4.20-30',
              //             assetName: demo[index],
              //             offset: pageOffset,
              //           );
              //         })),
              )),
          SliverFillRemaining(
            fillOverscroll: true,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('우먼'),
                    Text('맨'),
                    Text('라이프'),
                    Text('선물'),
                    Text('베스트'),
                    Text('추천'),
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
