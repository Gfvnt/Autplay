import 'package:autplay/app/core/ui/styles/colors_app.dart';
import 'package:autplay/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final VoidCallback onTap;
  final String assetImage;
  final String gameName;

  const GameButton({
    super.key,
    required this.onTap,
    required this.assetImage,
    required this.gameName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: ColorsApp.instance.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(
                height: 85,
                width: 85,
                child: Image.asset(
                  assetImage,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                gameName,
                style: context.textStyle.textBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
