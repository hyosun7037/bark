import 'package:flutter/material.dart';

class ShopTestPage extends StatefulWidget {
  @override
  ShopTestPage({Key? key}) : super(key: key);

  @override
  State<ShopTestPage> createState() => _ShopTestPageState();
}

class _ShopTestPageState extends State<ShopTestPage> {
  int selectedIndex = 0;
  PageController _pageController = PageController();
  int pagesCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 150,
            child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 5);
                },
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        _pageController.jumpToPage(index);
                      });
                    },
                    child: Container(
                      child: Row(
                        children: [
                          AnimatedContainer(
                              duration: Duration(microseconds: 500),
                              height: (selectedIndex == index) ? 50 : 0,
                              color: Colors.blue),
                          Expanded(
                              child: AnimatedContainer(
                            duration: Duration(milliseconds: 50),
                            alignment: Alignment.center,
                            height: 50,
                            color: (selectedIndex == index)
                                ? Colors.blueGrey.withOpacity(0.2)
                                : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Text('$index'),
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
                child: PageView(
              controller: _pageController,
              children: [
                for (var i = 0; i < pagesCount; i++)
                  Container(
                    child: Text('page$i'),
                  )
              ],
            )),
          )
        ],
      ),
    );
  }
}
