import 'package:animations/animations.dart';
import 'package:barktest/home/pages/home_page.dart';
import 'package:barktest/like_page.dart';
import 'package:barktest/main.dart';
import 'package:barktest/my_page.dart';
import 'package:barktest/shop_page.dart';
import 'package:barktest/contents_page.dart';
import 'package:flutter/material.dart';

// 페이지별 페이드인 전환
class FadeThroughPage extends StatefulWidget {
  const FadeThroughPage({Key? key}) : super(key: key);

  @override
  State<FadeThroughPage> createState() => _FadeThroughPageState();
}

class _FadeThroughPageState extends State<FadeThroughPage> {
  int index = 0;
  final pages = [HomePage(), ShopPage(), ContentsPage(), LikePage(), MyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
          duration: Duration(seconds: 1),
          transitionBuilder: (child, animation, secondaryAnimation) =>
              SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              ),
          // FadeThroughTransition(
          //     animation: animation,
          //     secondaryAnimation: secondaryAnimation,
          //     child: child),
          child: pages[index]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          elevation: 0,
          fixedColor: Colors.black45,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          onTap: (int index) => setState(() => this.index = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black45,
                ),
                label: 'HOME'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.black45,
                ),
                label: 'SHOP'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pending_actions,
                  color: Colors.black45,
                ),
                label: 'CONTENTS'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline_outlined,
                  color: Colors.black45,
                ),
                label: 'LIKE'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: Colors.black45,
                ),
                label: 'MY'),
          ]),
    );
  }
}
