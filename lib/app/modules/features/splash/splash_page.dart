import 'package:autplay/app/core/ui/helpers/size_extensions.dart';
import 'package:autplay/app/core/ui/styles/colors_app.dart';
import 'package:autplay/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return const HomePage();
              },
              transitionsBuilder:
                  (___, Animation<double> animation, ____, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: RotationTransition(
                    turns:
                        Tween<double>(begin: 0.4, end: 1.0).animate(animation),
                    child: child,
                  ),
                );
              }),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.instance.seconderyColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image/autplay_logo.png',
            fit: BoxFit.contain,
            height: context.percentHeight(0.15),
          ),
          const SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            backgroundColor: ColorsApp.instance.seconderyColor,
          ),
        ],
      ),
    );
  }
}
