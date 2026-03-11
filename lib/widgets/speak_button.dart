import 'package:flutter/material.dart';

class SpeakButton extends StatelessWidget {
  const SpeakButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.volume_up),
        label: const Text("Speak Now", style: TextStyle(fontSize: 18)),
        onPressed: onPressed,
      ),
    );
  }
}
