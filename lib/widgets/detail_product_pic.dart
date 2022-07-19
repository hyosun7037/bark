import 'package:flutter/material.dart';

class DetailProductPic extends StatelessWidget {
  const DetailProductPic({
    Key? key,
    this.image = '',
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: 260,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(image), fit: BoxFit.contain)),
    );
  }
}
