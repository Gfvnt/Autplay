// procurar sobre mixin no flutter, basicamente é uma herança multiplica por meio dos mixis

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  // para saber se o loader esta aberto ou nao
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return LoadingAnimationWidget.threeArchedCircle(
                color: Colors.white, size: 60);
          });
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  void dispose() {
    hideLoader();
    super.dispose();
  }
}
