import 'package:flutter/material.dart';

class SpeechTextInput extends StatelessWidget {
  final TextEditingController controller;
  const SpeechTextInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 6,
      decoration: InputDecoration(
        hintText: "Type something to hear it right...",
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            controller.clear();
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
