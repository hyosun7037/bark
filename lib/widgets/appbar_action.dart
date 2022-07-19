import 'package:flutter/material.dart';

class AppbarAction extends StatelessWidget {
  const AppbarAction({
    Key? key,
    required this.icon,
    this.color = Colors.black54,
  }) : super(key: key);

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Icon(
          icon,
          color: Colors.black54,
        ),
      ),
    );
  }
}
