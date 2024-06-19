import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final void Function()? onTap;
  final String imagePath;
  const SquareTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
