import 'dart:async';

import 'package:barktest/item_list.dart';
import 'package:barktest/sliding_cards_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FadeOnScroll extends StatefulWidget {
  const FadeOnScroll({Key? key}) : super(key: key);

  @override
  State<FadeOnScroll> createState() => _FadeOnScrollState();
}

class _FadeOnScrollState extends State<FadeOnScroll> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    // 자동스크롤
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(currentPage,
          duration: Duration(microseconds: 350), curve: Curves.easeIn);
    });
    pageController = PageController(viewportFraction: 1);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page!);
    });
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
        slivers: [
          SliverAppBar(
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            actions: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(Icons.search),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(Icons.notifications_active_outlined),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ],
            expandedHeight: 455,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
                background: PageView.builder(
                    controller: pageController,
                    itemCount: demo.length,
                    onPageChanged: (value) {},
                    itemBuilder: (context, index) {
                      return SlidingCard(
                        name: '브랜드 즐겨찾기$index',
                        date: '4.20-30',
                        assetName: demo[index],
                        offset: pageOffset,
                      );
                    })),
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
