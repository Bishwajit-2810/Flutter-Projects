import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final Color color;
  final Widget child;
  const Box({super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(40),
      child: child,
    );
  }
}
