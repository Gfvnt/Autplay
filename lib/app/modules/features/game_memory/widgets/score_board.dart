import 'package:autplay/app/core/ui/styles/colors_app.dart';
import 'package:autplay/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  final String title;
  final String info;

  const ScoreBoard({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(26.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: ColorsApp.instance.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: context.textStyle.textTitle,
            ),
            Text(
              info,
              style: context.textStyle.textTitle,
            ),
          ],
        ),
      ),
    );
  }
}
