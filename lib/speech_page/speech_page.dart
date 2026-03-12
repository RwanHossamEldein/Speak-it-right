import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_it_right/providers/speech_notifier.dart';
import 'package:speak_it_right/widgets/pitch_slider.dart';
import 'package:speak_it_right/widgets/speak_button.dart';
import 'package:speak_it_right/widgets/speech_text_input.dart';
import 'package:speak_it_right/widgets/speed_slider.dart';
import 'package:speak_it_right/widgets/voice_dropdown.dart';

class SpeechPage extends ConsumerWidget {
  const SpeechPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSpeaking = ref.watch(
      speechNotifierProvider.select((state) => state.isSpeaking),
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 26, 41),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 26, 41),
        title: const Text(
          "Speak It Right",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isSpeaking ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),

            onPressed: () {
              final notifier = ref.read(speechNotifierProvider.notifier);

              if (isSpeaking) {
                notifier.stop();
              } else {
                notifier.speak();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SpeechTextInput(),
            const SizedBox(height: 30),

            PitchSlider(),
            const SizedBox(height: 20),

            SpeedSlider(),
            const SizedBox(height: 20),

            VoiceDropdown(),

            const Spacer(),

            SpeakButton(
              onPressed: () {
                ref.read(speechNotifierProvider.notifier).speak();
              },
            ),
          ],
        ),
      ),
    );
  }
}
