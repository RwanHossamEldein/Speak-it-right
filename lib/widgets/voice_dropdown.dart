import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_it_right/providers/speech_notifier.dart';

class VoiceDropdown extends ConsumerWidget {
  const VoiceDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(
      speechNotifierProvider.select((state) => state.voices),
    );
    final value = ref.watch(
      speechNotifierProvider.select((state) => state.voice),
    );
    final onChanged = ref.read(speechNotifierProvider.notifier).updateVoice;

    return DropdownButton<String>(
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
      value: value,
      hint: Text("Language & Voice"),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
