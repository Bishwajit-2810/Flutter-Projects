import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  void Function()? onTap;
  final Color color;
  Button({
    super.key,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(20),
        child: const Center(
          child: Text("Tap"),
        ),
      ),
    );
  }
}
