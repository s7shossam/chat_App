import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, this.onPressed, required this.text});
  VoidCallback? onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(child: Text(text)),
      ),
    );
  }
}
