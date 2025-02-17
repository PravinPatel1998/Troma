import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double slider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Selected Value: ${slider.toStringAsFixed(1)}",
              style: TextStyle(fontSize: 18)),
          Slider(
              value: slider,
              min: 0,
              max: 100,
              divisions: 100,
              label: slider.round().toString(),
              onChanged: (onChanged) {
                setState(() {
                  slider = onChanged;
                });
              })
        ],
      ),
    );
  }
}
