import 'package:autplay/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

import 'widgets/game_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.instance.seconderyColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsApp.instance.primaryColor,
        title: Image.asset(
          'assets/image/autplay_logo.png',
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GameButton(
                  onTap: () => Navigator.pushNamed(context, '/memory-game'),
                  assetImage: 'assets/image/calculator.jpeg',
                  gameName: 'Jogo da Memória',
                ),
                GameButton(
                  onTap: () => Navigator.pushNamed(context, '/tic-tac-toe'),
                  assetImage: 'assets/image/pizzle_2.jpg',
                  gameName: 'Jogo da Velha',
                ),
                GameButton(
                  onTap: () => Navigator.pushNamed(context, '/puzzle'),
                  assetImage: 'assets/image/pizzle.jpeg',
                  gameName: 'Quebra Cabeça',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
