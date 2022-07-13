import 'package:flutter/material.dart';

class dot extends StatelessWidget {
  int index;
  int active;
  dot({
    Key? key,
    required this.index,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13,
      width: index == active ? 40 : 12,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: index == active ? Colors.red : Colors.red.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
