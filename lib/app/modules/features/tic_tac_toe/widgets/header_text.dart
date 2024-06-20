import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String currentPlayer;

  const HeaderText({
    super.key,
    required this.currentPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Jogo da Velha',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$currentPlayer turno',
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
