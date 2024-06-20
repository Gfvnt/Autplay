import 'package:autplay/app/core/ui/helpers/size_extensions.dart';
import 'package:flutter/material.dart';

import 'grid_button.dart';

// ignore: must_be_immutable
class Grid extends StatelessWidget {
  var numbers = [];
  // ignore: prefer_typing_uninitialized_variables
  var size;
  Function clickGrid;

  Grid(this.numbers, this.size, this.clickGrid, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.percentHeight(0.60),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 5,
          ),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return numbers[index] != 0
                ? GridButton(
                    text: '${numbers[index]}',
                    onPressed: () {
                      clickGrid(index);
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
