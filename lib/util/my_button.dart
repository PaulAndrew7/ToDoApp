import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;

  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color(0xBAC6E7FF),
      child: Text(text),

    );
  }
}