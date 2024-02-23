import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const LottieExampleApp());
}

class LottieExampleApp extends StatelessWidget {
  const LottieExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Lottie.asset('assets/animations/Pyramid.json'),
      ),
    );
  }
}
