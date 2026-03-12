import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_it_right/providers/speech_notifier.dart';

class SpeedSlider extends ConsumerWidget {
  const SpeedSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speedValue = ref.watch(
      speechNotifierProvider.select((state) => state.speed),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Speed : ${speedValue.toStringAsFixed(1)}",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 254, 254),
          ),
        ),

        Slider(
          min: 0.5,
          max: 2,
          value: speedValue,
          onChanged: (value) =>
              ref.read(speechNotifierProvider.notifier).updateSpeed(value),
          activeColor: Color(Colors.white.value),
        ),
      ],
    );
  }
}
