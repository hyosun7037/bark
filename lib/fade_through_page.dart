import 'package:animations/animations.dart';
import 'package:barktest/fade_on_scroll.dart';
import 'package:barktest/main.dart';
import 'package:barktest/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FadeThroughPage extends StatefulWidget {
  const FadeThroughPage({Key? key}) : super(key: key);

  @override
  State<FadeThroughPage> createState() => _FadeThroughPageState();
}

class _FadeThroughPageState extends State<FadeThroughPage> {
  int index = 0;
  final pages = [FadeOnScroll(), SecondPage()];

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
          currentIndex: index,
          onTap: (int index) => setState(() => this.index = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'page1'),
            BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'page2')
          ]),
    );
  }
}
