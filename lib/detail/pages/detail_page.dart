// ignore_for_file: prefer_const_constructors

import 'package:barktest/widgets/appbar_action.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black54,
        ),
        elevation: 0,
        actions: [
          AppbarAction(
            icon: Icons.home_outlined,
            color: Colors.black54,
          ),
          AppbarAction(icon: Icons.search_outlined),
          AppbarAction(
            icon: Icons.shopping_bag_outlined,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
