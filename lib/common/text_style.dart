import 'package:task1/utils/imports.dart';

class CommonTextStyle extends StatelessWidget {
  const CommonTextStyle({
    Key? key,
    required this.name,
    required this.style,
    this.color,
    this.maxLines = 1, // Add maxLines parameter with default value
  }) : super(key: key);

  final String name;
  final TextStyle style;
  final Color? color;
  final int maxLines; // Include maxLines property

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      name,
      style: style.copyWith(
        letterSpacing: 0.9,
        color: color,
      ),
      maxLines: maxLines, // Pass maxLines to AutoSizeText
      textAlign: TextAlign.center,
    );
  }
}


