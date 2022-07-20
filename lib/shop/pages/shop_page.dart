import 'package:barktest/home/pages/home_page.dart';
import 'package:barktest/item_list.dart';
import 'package:barktest/shop/controller/shop_controller.dart';
import 'package:barktest/widgets/appbar_action.dart';
import 'package:barktest/widgets/circle_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

class ShopPage extends GetView<ShopController> {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShopController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width * .7,
            child: Icon(
              Icons.search_outlined,
              color: Colors.black54,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0XFFf0f0f0)),
          ),
        ),
        elevation: 0,
        actions: const [
          AppbarAction(icon: Icons.notifications_none_outlined),
          AppbarAction(
            icon: Icons.shopping_bag_outlined,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          children: [
            // 가로 동그라미 배너
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CircleBanner(
                    image: 'assets/test01.jpg',
                    title: '수제간식',
                  ),
                  CircleBanner(
                    image: 'assets/test02.jpg',
                    title: '신제품',
                  ),
                  CircleBanner(
                    image: 'assets/test03.jpg',
                    title: '이벤트',
                  ),
                  CircleBanner(
                    image: 'assets/test04.jpg',
                    title: '할인전',
                  ),
                  CircleBanner(
                    image: 'assets/test05.jpg',
                    title: '기타',
                  )
                ],
              ),
            ),
            // verticalTabBar
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  child: VerticalTabs(
                    tabTextStyle: TextStyle(
                      fontSize: 13,
                    ),
                    tabsWidth: 100,
                    indicatorWidth: 0,
                    tabsElevation: 0,
                    indicatorColor: Colors.white,
                    selectedTabBackgroundColor: Colors.white,
                    contentScrollAxis: Axis.vertical,
                    tabs: controller.myTabs,
                    contents: [
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.white,
                        height:
                            MediaQuery.of(context).size.height - kToolbarHeight,
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/test01.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height -
                                  (MediaQuery.of(context).padding.top +
                                      kToolbarHeight +
                                      185),
                              child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 3 / 1,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                children: List.generate(7, (index) {
                                  return Category(category: category[index]);
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text('test'),
                      Text('test'),
                      Text('test'),
                      Text('test'),
                      Text('test'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
    this.category = '',
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * .45,
        height: 10,
        decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
        child: Text(category),
      ),
    );
  }
}
