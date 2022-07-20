import 'package:flutter/material.dart';

class CircleBanner extends StatelessWidget {
  const CircleBanner({
    Key? key,
    this.image = '',
    this.title = '',
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(title)
        ],
      ),
    );
  }
}
