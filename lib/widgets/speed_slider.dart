import 'package:flutter/material.dart';

class SpeedSlider extends StatelessWidget {
  final double speedValue;
  final ValueChanged<double> onChanged;

  const SpeedSlider({super.key, this.speedValue = 1, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Speed : ${speedValue.toStringAsFixed(1)}"),

        Slider(min: 0.5, max: 2, value: speedValue, onChanged: onChanged),
      ],
    );
  }
}
