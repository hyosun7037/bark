// ignore_for_file: prefer_const_constructors

import 'package:barktest/detail/controller/detail_controller.dart';
import 'package:barktest/widgets/appbar_action.dart';
import 'package:barktest/widgets/appbar_leading.dart';
import 'package:barktest/widgets/bottom_sheet.dart';
import 'package:barktest/widgets/detail_product_pic.dart';
import 'package:barktest/widgets/detail_product_txt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  @override
  final controller = Get.put(DetailController());
  DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '제품정보',
          style: TextStyle(color: Colors.black54),
        ),
        leading: AppbarLeading(),
        elevation: 0,
        actions: const [
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
      // 하단 고정 메뉴 (찜하기, 구매하기)
      bottomSheet: BottonSheet(controller: controller),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            DetailProductPic(
              image: 'assets/product01.jpeg',
            ),
            DetailProductTxt(
              title: '오리젠 오리지날',
              desc: '[340g 증정] 오리젠 오리지날 독 11.4kg',
              price: '132,000원',
            )
          ],
        ),
      ),
    );
  }
}
