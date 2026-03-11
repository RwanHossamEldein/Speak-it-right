import 'package:flutter/material.dart';

class PitchSlider extends StatelessWidget {
  final double pitchValue;
  final ValueChanged<double> onChanged;

  const PitchSlider({super.key, this.pitchValue = 1, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pitch : ${pitchValue.toStringAsFixed(1)}"),

        Slider(min: 0.5, max: 2, value: pitchValue, onChanged: onChanged),
      ],
    );
  }
}
