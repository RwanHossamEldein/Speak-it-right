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

    return DropdownButton<String>(
      dropdownColor: const Color.fromARGB(255, 12, 26, 41),

      items: items
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e, style: TextStyle(color: Colors.white)),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value != null) {
          ref.read(speechNotifierProvider.notifier).updateVoice(value);
          // Removed auto-speak; user presses Speak button now
        }
      },
      value: items.contains(value) ? value : null,
      hint: const Text("Language & Voice"),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
