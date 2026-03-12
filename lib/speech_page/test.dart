import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSTestPage extends StatefulWidget {
  const TTSTestPage({super.key});

  @override
  State<TTSTestPage> createState() => _TTSTestPageState();
}

class _TTSTestPageState extends State<TTSTestPage> {
  final FlutterTts tts = FlutterTts();

  void speak() async {
    await tts.setPitch(2);
    await tts.setSpeechRate(0.3);
    await tts.setLanguage("en-US");
    await tts.speak("howhowhowhow");
    await tts.setVoice(await tts.getVoices);

    await tts.setVolume(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TTS Test")),
      body: Center(
        child: ElevatedButton(
          onPressed: speak,
          child: const Text("Speak Text"),
        ),
      ),
    );
  }
}
