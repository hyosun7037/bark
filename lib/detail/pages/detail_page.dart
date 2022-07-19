// ignore_for_file: prefer_const_constructors

import 'package:barktest/widgets/appbar_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);
  final String dropdownValue = '수량';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '제품정보',
          style: TextStyle(color: Colors.black54),
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
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
      // 하단 고정 메뉴
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.black87,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                  width: MediaQuery.of(context).size.width * .5,
                  alignment: Alignment.center,
                  child: Text(
                    "찜하기",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  context: context,
                  builder: (context) => Container(
                        height: 130,
                        child: Column(
                          children: [
                            // 드롭다운
                            // 구매수량 증감
                            // 상품명
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("오리젠 오리지날"),
                                  Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black87)),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 30,
                                            child: Container(
                                              child: Icon(Icons.remove),
                                            )),
                                        Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 50,
                                            child: Container(
                                              child: Text('1'),
                                            )),
                                        Container(
                                            height: 30,
                                            child: Container(
                                              child: Icon(Icons.add),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // 장바구니 담기, 바로구매 버튼
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * .45,
                                  height: 50,
                                  child: Text("장바구니 담기"),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.black87)),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * .45,
                                  height: 50,
                                  child: Text(
                                    "바로 구매하기",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  decoration:
                                      BoxDecoration(color: Colors.black87),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  "구매하기",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/product01.jpeg'),
                      fit: BoxFit.contain)),
            ),
            Text('오리젠 오리지날'),
            Text('[340g 증정] 오리젠 오리지날 독 11.4kg'),
            Text('132,000원'),
          ],
        ),
      ),
    );
  }
}
