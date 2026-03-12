class SpeechState {
  final double pitch;
  final double speed;
  final String voice;
  final List<String> voices;
  final String text;
  final List<String> favorites;
  final bool isSpeaking;

  const SpeechState({
    this.pitch = 1.0,
    this.speed = 1.0,
    this.voice = 'en',
    this.voices = const [],
    this.text = '',
    this.favorites = const [],
    this.isSpeaking = false,
  });

  SpeechState copyWith({
    double? pitch,
    double? speed,
    String? voice,
    List<String>? voices,
    String? text,
    List<String>? favorites,
    bool? isSpeaking,
  }) {
    return SpeechState(
      pitch: pitch ?? this.pitch,
      speed: speed ?? this.speed,
      voice: voice ?? this.voice,
      voices: voices ?? this.voices,
      text: text ?? this.text,
      favorites: favorites ?? this.favorites,
      isSpeaking: isSpeaking ?? this.isSpeaking,
    );
  }
}
