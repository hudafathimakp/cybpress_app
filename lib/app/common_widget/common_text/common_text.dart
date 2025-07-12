import 'package:flutter/material.dart';


class NormalText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;

  const NormalText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 14.0,

    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;

  const HeadingText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 30.0,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class CommonRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color1;
  final Color color2;

  const CommonRichText({
    super.key,
    required this.text1,
    required this.text2,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.bold,
    this.color1 = Colors.white,
    this.color2 = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color1,
            ),
          ),
          TextSpan(
            text: text2,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color2,
            ),
          ),
        ],
      ),
    );
  }
}
