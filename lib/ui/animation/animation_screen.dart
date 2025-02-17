import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Animation"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Animate(
                  effects: [FadeEffect(), ScaleEffect()],
                  child: Center(
                    child: Text(
                      "Hello",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  )),
              Text("hhhhjjk")
                  .animate()
                  .fade(delay: 500.ms)
                  .scale(duration: 600.ms)
            ],
          ),
        ));
  }
}
