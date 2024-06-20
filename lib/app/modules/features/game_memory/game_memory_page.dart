import 'dart:developer';

import 'package:autplay/app/core/ui/styles/colors_app.dart';
import 'package:autplay/app/core/ui/styles/text_styles.dart';
import 'package:autplay/app/modules/features/game_memory/utils/game_logic.dart';
import 'package:autplay/app/modules/features/game_memory/widgets/score_board.dart';
import 'package:flutter/material.dart';

class GameMemoryPage extends StatefulWidget {
  const GameMemoryPage({super.key});

  @override
  State<GameMemoryPage> createState() => _GameMemoryPageState();
}

class _GameMemoryPageState extends State<GameMemoryPage> {
  final GameLogic _gameLogic = GameLogic();

  //* adicionando variavel tentativas e pontos
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    _gameLogic.initGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;

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
          Text(
            'Jogo da memoria',
            style: context.textStyle.textTitle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //* widget para o placar;
              ScoreBoard(title: 'Tentativas', info: '$tries'),
              ScoreBoard(title: 'Pontos', info: '$score'),
            ],
          ),
          SizedBox(
            height: sizeWidth,
            width: sizeWidth,
            child: GridView.builder(
              itemCount: _gameLogic.gameImg!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //* aqui iremos colocar a logica do jogo
                    setState(() {
                      tries++;
                      _gameLogic.gameImg![index] = _gameLogic.cardList[index];
                      _gameLogic.matchCheck.add(
                        {index: _gameLogic.cardList[index]},
                      );
                    });
                    if (_gameLogic.matchCheck.length == 2) {
                      if (_gameLogic.matchCheck[0].values.first ==
                          _gameLogic.matchCheck[1].values.first) {
                        log('true');
                        score += 100;
                        _gameLogic.matchCheck.clear();
                      } else {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          log('false');
                          setState(() {
                            _gameLogic.gameImg![_gameLogic.matchCheck[0].keys
                                .first] = _gameLogic.hiddenCardpath;
                            _gameLogic.gameImg![_gameLogic.matchCheck[1].keys
                                .first] = _gameLogic.hiddenCardpath;
                            _gameLogic.matchCheck.clear();
                          });
                        });
                      }
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: ColorsApp.instance.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(_gameLogic.gameImg![index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
