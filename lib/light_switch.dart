import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LightSwitch extends StatefulWidget {
  const LightSwitch({super.key});

  @override
  State<LightSwitch> createState() => _LightSwitchState();
}

class _LightSwitchState extends State<LightSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// The frame on which the animation reaches the day state
  final double _dayFrame = 60;

  /// Information about the Lottie file
  late final LottieComposition _composition;

  /// Inner state for whether it is day or night
  bool _isDay = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeDayNight,
      child: DotLottieLoader.fromAsset(
        'assets/animations/Light switch.lottie',
        frameBuilder: (context, dotLottie) {
          if (dotLottie != null) {
            return Lottie.memory(
              // .lottie can contain more than one animation
              // pick one
              dotLottie.animations.values.single,
              controller: _controller,
              onLoaded: (composition) {
                // the content of this Lottie animation
                _controller.duration = composition.duration;
                _composition = composition;
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  /// Change to day if night and vice versa.
  /// Ignore input if the animation is still in progress.
  void changeDayNight() async {
    if (_controller.isAnimating) return;
    if (_isDay == true) {
      await animateToNight();
      _isDay = false;
    } else {
      await animateToDay();
      _isDay = true;
    }
  }

  /// Animate the switch to the day position
  TickerFuture animateToDay() =>
      _controller.animateTo(_dayFrame / _composition.durationFrames);

  /// Animate the switch to the night position
  TickerFuture animateToNight() => _controller.animateBack(0);
}
