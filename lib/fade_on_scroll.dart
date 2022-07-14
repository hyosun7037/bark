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
  bool _changedColor = false;

  @override
  Widget build(BuildContext context) {
    scroll.addListener(() {
      //final scrollPositionPixels = scroll.position.pixels;
      controller.getColor(scroll.position.pixels);
    });
    return Scaffold(
      body: CustomScrollView(
        controller: scroll,
        slivers: [
          Obx(() => SliverAppBar(
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
              expandedHeight: 455,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Swiper(
                  autoplayDisableOnInteraction: false,
                  autoplay: true,
                  itemCount: demo.length,
                  itemBuilder: (context, index) {
                    return SlidingCard(
                      name: '브랜드 즐겨찾기$index',
                      date: '4.20-30',
                      assetName: demo[0],
                      offset: pageOffset,
                    );
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
