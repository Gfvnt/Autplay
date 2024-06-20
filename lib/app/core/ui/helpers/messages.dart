//ira abrir o dialog dos projetos

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showErro(String message) {
    _showSnackBar(AwesomeSnackbarContent(
      title: 'Erro',
      message: message,
      contentType: ContentType.failure,
    ));
  }

  void showWarning(String message) {
    _showSnackBar(AwesomeSnackbarContent(
      title: 'Atenção',
      message: message,
      contentType: ContentType.warning,
    ));
  }

  void showInfo(String message) {
    _showSnackBar(AwesomeSnackbarContent(
      title: 'Atenção',
      message: message,
      contentType: ContentType.help,
    ));
  }

  void showSucess(String message) {
    _showSnackBar(AwesomeSnackbarContent(
      title: 'Sucesso',
      message: message,
      contentType: ContentType.success,
    ));
  }

  void _showSnackBar(AwesomeSnackbarContent content) {
    //abrindo a snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.only(top: 72),
      backgroundColor: Colors.transparent,
      content: content,
    ));
  }
}
