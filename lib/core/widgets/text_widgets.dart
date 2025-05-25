import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/core/utils/app_extensions.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.capitalizeFirst(),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}

class BodyLargeText extends StatelessWidget {
  final String body;

  const BodyLargeText({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Text(
      body.capitalizeFirst(),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

class BodyText extends StatelessWidget {
  final String body;
  final TextStyle? textStyle;

  const BodyText({super.key, required this.body, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      body.capitalizeFirst(),
      style: TextStyle(
        fontWeight: textStyle?.fontWeight ?? FontWeight.normal,
        fontSize: 14,
        color: textStyle?.color,
      ),
    );
  }
}
