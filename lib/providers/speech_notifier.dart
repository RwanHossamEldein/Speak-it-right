import 'package:flutter_riverpod/legacy.dart';
import 'package:speak_it_right/providers/speech_state.dart';

class SpeechNotifier extends StateNotifier<SpeechState> {
  SpeechNotifier() : super(const SpeechState());
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
}

final speechNotifierProvider =
    StateNotifierProvider<SpeechNotifier, SpeechState>((ref) {
      return SpeechNotifier();
    });
