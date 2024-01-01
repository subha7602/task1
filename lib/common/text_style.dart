import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class CommonTextStyle extends StatelessWidget {
  const CommonTextStyle({
    super.key,
    required this.name,
    required this.style,
    this.color, // Add this line
  });

  final String name;
  final TextStyle style;
  final Color? color; // Add this line

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      name,
      style: style.copyWith(
        letterSpacing: 1.0,
        color: color,

         // Add this line
      ),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}

