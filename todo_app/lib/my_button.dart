import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  VoidCallback? onPressed;
  final String buttonName;
  MyButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(buttonName),
    );
  }
}
