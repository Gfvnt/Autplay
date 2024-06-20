import 'package:flutter/material.dart';

class GameLogic {
  final Color hiddenColor = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;

  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];

  final String hiddenCardpath = 'assets/image/hidden.jpg';
  List<String> cardList = [
    'assets/image/circle-blue.png',
    'assets/image/car-red.png',
    'assets/image/car-yellow.jpg',
    'assets/image/star-yellow.png',
    'assets/image/star-yellow.png',
    'assets/image/circle-blue.png',
    'assets/image/car-red.png',
    'assets/image/car-yellow.jpg',
  ];

  final int cardCount = 8;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenColor);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
