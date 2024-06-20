import 'text_styles.dart';
import 'package:flutter/material.dart';

import 'colors_app.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();
  static AppStyles get instance {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        backgroundColor: ColorsApp.instance.primaryColor,
        textStyle: TextStyles.instance.textButtonLabel,
      );
}

extension AppStyleExtensions on BuildContext {
  AppStyles get appStyle => AppStyles.instance;
}
