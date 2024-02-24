import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'light_switch.dart';

void main() {
  runApp(const LottieExampleApp());
}

class LottieExampleApp extends StatelessWidget {
  const LottieExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DotLottieLoader.fromAsset(
                "assets/animations/Pyramid.lottie",
                frameBuilder: (BuildContext context, DotLottie? dotlottie) {
                  if (dotlottie != null) {
                    // check whether the animation has been loaded
                    return Lottie.memory(dotlottie.animations.values.single);
                  } else {
                    // what to render while it is loading
                    return Container();
                  }
                },
              ),
              const LightSwitch(),
            ],
          ),
        ),
      ),
    );
  }
}
