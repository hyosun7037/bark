import 'package:barktest/fade_on_scroll.dart';
import 'package:barktest/fade_through_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bark',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
      home: FadeThroughPage(),
    );
  }
}
