import 'package:barktest/detail/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottonSheet extends StatelessWidget {
  const BottonSheet({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      height: 190,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("오리젠 오리지날"),
                                Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.black87)),
                                  child: Obx(() => Row(
                                        children: [
                                          // -
                                          GestureDetector(
                                            onTap: () =>
                                                controller.removeNumber(),
                                            child: Container(
                                                width: 20,
                                                height: 30,
                                                child: Container(
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 15,
                                                  ),
                                                )),
                                          ),
                                          // 수량
                                          Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 50,
                                              child: Container(
                                                child: Text(controller
                                                    .currentNum
                                                    .toString()),
                                              )),
                                          // +
                                          GestureDetector(
                                            onTap: () => controller.addNumber(),
                                            child: Container(
                                                width: 20,
                                                height: 30,
                                                child: Container(
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 15,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                          // 총 상품금액
                          Padding(
                            padding:
                                EdgeInsets.only(top: 0, left: 20, right: 20),
                            child: Divider(
                              thickness: 2,
                              color: Colors.black87,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('총 상품 금액  '),
                                Obx(() => Text(
                                      '${controller.totalPrice}원',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ))
                              ],
                            ),
                          ),
                          // 장바구니 담기, 바로구매 버튼
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * .45,
                                height: 50,
                                child: Text("장바구니 담기"),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black87)),
                              ),
                              SizedBox(width: 5),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * .45,
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
    );
  }
}
