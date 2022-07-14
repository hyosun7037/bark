import 'package:barktest/item_list.dart';
import 'package:barktest/sliding_cards_view.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FadeOnScroll extends StatefulWidget {
  const FadeOnScroll({Key? key}) : super(key: key);

  @override
  State<FadeOnScroll> createState() => _FadeOnScrollState();
}

class _FadeOnScrollState extends State<FadeOnScroll>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  double pageOffset = 0;
  var scroll = ScrollController();
  bool _changedColor = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        reverseDuration: Duration(milliseconds: 300));
    scroll.addListener(() {
      print(scroll.position.pixels);
      // print(scroll.offset);
      // final reachTop = (scroll.offset <= scroll.position.minScrollExtent &&
      //     !scroll.position.outOfRange);
      // print(reachTop);
      final changedColor = scroll.position.pixels > 366 ? true : false;

      if (scroll.position.pixels > 366) {
        setState(() {
          _changedColor = changedColor;
        });
      }
    });
    // 자동스크롤
    // Timer.periodic(Duration(seconds: 5), (Timer timer) {
    //   if (currentPage < 2) {
    //     currentPage++;
    //   } else {
    //     currentPage = 0;
    //   }
    //   pageController.animateToPage(currentPage,
    //       duration: Duration(microseconds: 50), curve: Curves.ease);
    // });
    // pageController = PageController(viewportFraction: 1);
    // pageController.addListener(() {
    //   setState(() => pageOffset = pageController.page!);
    // });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scroll,
        slivers: [
          SliverAppBar(
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(Icons.search,
                        color: _changedColor ? Colors.black : Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(Icons.notifications_active_outlined,
                        color: _changedColor ? Colors.black : Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: _changedColor ? Colors.black : Colors.white,
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
              ),
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
