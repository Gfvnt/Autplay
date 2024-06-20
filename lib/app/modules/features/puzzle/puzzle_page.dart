import 'package:autplay/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

import 'widgets/grid_details.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      body: SafeArea(
        child: Container(
          height: size.height,
          margin: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Grid(numbers, size, clickGrid),
            ],
          ),
        ),
      ),
    );
  }

  void clickGrid(index) {
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        move++;
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
      });
    }
    // checkWin();
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
    });
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  // void checkWin() {
  //   if (isSorted(numbers)) {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return Dialog(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20.0)), //this right here
  //             child: SizedBox(
  //               height: 200,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(30.0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     const Text(
  //                       "You Win!!",
  //                       style: TextStyle(fontSize: 20),
  //                     ),
  //                     SizedBox(
  //                       width: 220.0,
  //                       child: ElevatedButton(
  //                         onPressed: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: const Text(
  //                           "Close",
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         });
  //   }
  // }
}
