import 'package:chatt/models/message.dart';
import 'package:flutter/material.dart';
import 'package:chatt/constants.dart';

class chat_Bubble extends StatelessWidget {
  const chat_Bubble({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),

        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),

            bottomRight: Radius.circular(16),
          ),
          color: kPrimatyColor,
        ),
        child: Text(message.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
