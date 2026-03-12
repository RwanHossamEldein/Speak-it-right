import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_it_right/providers/speech_notifier.dart';

class SpeechTextInput extends ConsumerWidget {
  const SpeechTextInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(
      speechNotifierProvider.select((state) => state.text),
    );
    return TextField(
      controller: TextEditingController(text: text)
        ..selection = TextSelection.fromPosition(
          TextPosition(offset: text.length),
        ),

      maxLines: 6,
      decoration: InputDecoration(
        hintText: "Type something to hear it right...",
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            ref.read(speechNotifierProvider.notifier).updateText(text);
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
