import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarLeading extends StatelessWidget {
  const AppbarLeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Icon(
        Icons.arrow_back,
        color: Colors.black54,
      ),
    );
  }
}
