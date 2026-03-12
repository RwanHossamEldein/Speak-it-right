import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_it_right/providers/speech_notifier.dart';

class PitchSlider extends ConsumerWidget {
  const PitchSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pitchValue = ref.watch(
      speechNotifierProvider.select((state) => state.pitch),
    );
    final onChanged = ref.read(speechNotifierProvider.notifier).updatePitch;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pitch : ${pitchValue.toStringAsFixed(1)}"),

        Slider(min: 0.5, max: 2, value: pitchValue, onChanged: onChanged),
      ],
    );
  }
}
