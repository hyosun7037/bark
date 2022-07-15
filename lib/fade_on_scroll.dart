import 'package:barktest/controller/appbar_controller.dart';
import 'package:barktest/item_list.dart';
import 'package:barktest/sliding_cards_view.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
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
      void didChangeDependencies() {
        precacheImage(Image.asset('assets/meta.jpg').image, context);
        precacheImage(Image.asset('assets/test01.jpg').image, context);
        precacheImage(Image.asset('assets/test02.jpg').image, context);
        precacheImage(Image.asset('assets/test03.jpg').image, context);
        precacheImage(Image.asset('assets/test04.jpg').image, context);
      }
    });
    assetImageList = [
      'assets/test04.jpg',
      'assets/test05.jpg',
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
                        autoPlayAnimationDuration: Duration(milliseconds: 600),
                        initialPage: 1,
                        autoPlay: true,
                        viewportFraction: 1,
                        height: 500)),
                //     Swiper(
                //   curve: Curves.easeInOut,
                //   autoplay: true,
                //   axisDirection: flipAxisDirection(AxisDirection.left),
                //   itemWidth: MediaQuery.of(context).size.width,
                //   itemHeight: 600,
                //   // layout: SwiperLayout.STACK,
                //   itemCount: assetImageList.length,
                //   autoplayDisableOnInteraction: false,
                //   itemBuilder: (context, index) {
                //     final image = assetImageList[index];
                //     return Image(
                //       image: AssetImage(image),
                //       fit: BoxFit.cover,
                //     );
                //     // return SlidingCard(
                //     //   name: '',
                //     //   date: '',
                //     //   image: assetImageList[index],
                //     //   offset: pageOffset,
                //     // );
                //   },
                // ),
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
                child: Column(
                  children: [
                    Row(
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
