// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailProductTxt extends StatelessWidget {
  const DetailProductTxt({
    Key? key,
    this.title = '',
    this.desc = '',
    this.price = '',
  }) : super(key: key);

  final String title;
  final String desc;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            desc,
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            price,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
