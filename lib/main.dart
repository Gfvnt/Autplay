import 'package:autplay/app/modules/features/splash/splash_page.dart';
import 'package:autplay/app/modules/features/tic_tac_toe/tic_tac_toe_page.dart';
import 'package:autplay/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';

import 'app/core/ui/styles/colors_app.dart';
import 'app/modules/features/game_memory/game_memory_page.dart';
import 'app/modules/features/puzzle/puzzle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutPlay',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorsApp.instance.seconderyColor),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/memory-game': (context) => const GameMemoryPage(),
        '/tic-tac-toe': (context) => const TicTacToePage(),
        '/puzzle': (context) => const PuzzlePage(),
        '/homepage': (context) => const HomePage(),
      },
      home: const SplashPage(),
    );
  }
}
