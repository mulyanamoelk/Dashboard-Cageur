import 'package:flutter/material.dart';

import '../styles/consts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;
  final Color color;
  const CustomButton(
      {Key? key,
      required this.text,
      this.width = double.infinity,
      required this.onPressed,
      required this.color,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: kwhite, fontSize: 14, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
