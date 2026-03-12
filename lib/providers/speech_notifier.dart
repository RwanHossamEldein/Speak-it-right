import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speak_it_right/providers/speech_state.dart';

class SpeechNotifier extends StateNotifier<SpeechState> {
  final FlutterTts tts = FlutterTts();
  SpeechNotifier() : super(const SpeechState()) {
    loadVoices();
  }
  void updateText(String text) {
    state = state.copyWith(text: text);
  }

  void updatePitch(double pitch) {
    state = state.copyWith(pitch: pitch);
  }

  void updateSpeed(double speed) {
    state = state.copyWith(speed: speed);
  }

  void updateVoice(String voice) {
    state = state.copyWith(voice: voice);
  }

  void addFavorite(String text) {
    state = state.copyWith(favorites: [...state.favorites, text]);
  }

  void removeFromFavorites(String text) {
    state = state.copyWith(
      favorites: state.favorites.where((element) => element != text).toList(),
    );
  }

  void toggleIsSpeaking() {
    state = state.copyWith(isSpeaking: !state.isSpeaking);
  }

  Future<void> loadVoices() async {
    final voices = await tts.getVoices;

    final voiceNames = voices
        .map<String>((voice) => voice['name'].toString())
        .toList();

    state = state.copyWith(voices: voiceNames);
  }

  Future<void> speak() async {
    if (state.text.isEmpty) return;
    state = state.copyWith(isSpeaking: true);

    // Extract locale from voice name (e.g., 'en-US' from voice id)
    String locale = 'en-US'; // default
    if (state.voice.contains('-')) {
      final parts = state.voice.split('-');
      locale = '${parts[0]}-${parts[1]}';
    } else if (state.voice.length >= 2) {
      locale = state.voice.substring(0, 2).toUpperCase();
    }

    await tts.setLanguage(locale);
    await tts.setPitch(state.pitch);
    await tts.setSpeechRate(state.speed);
    await tts.setVoice({"name": state.voice});

    tts.setErrorHandler((msg) {
      print('TTS Error: $msg');
      state = state.copyWith(isSpeaking: false);
    });

    await tts.speak(state.text);
    tts.setCompletionHandler(() {
      state = state.copyWith(isSpeaking: false);
    });
  }

  Future<void> stop() async {
    await tts.stop();
  }
}

final speechNotifierProvider =
    StateNotifierProvider<SpeechNotifier, SpeechState>((ref) {
      return SpeechNotifier();
    });
