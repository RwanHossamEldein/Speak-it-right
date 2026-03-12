# Speak It Right 🗣️

**Description:**  
A Flutter app demonstrating **Text-to-Speech (TTS)** with **Riverpod** state management. Users can type text, adjust pitch and speed, select a voice, and save their favorite phrases. Ideal as a learning project for practicing Flutter widgets, state management, and TTS integration.

---

## Features ✅
- Input text for speech
- Adjust speech speed and pitch with sliders
- Select voice from available TTS options
- Play/Pause TTS
- Fully implemented using **Riverpod** for state management

---

## Getting Started 🚀

### Prerequisites
- Flutter SDK >= 3.0
- Dart >= 2.18
### Packages Used 📦

- flutter_riverpod – state management

- flutter_tts – text-to-speech
  
 ### How it Works 🛠️
 
- Riverpod manages SpeechState containing:
text, pitch, speed, voice, favorites, isSpeaking

- SpeechNotifier updates the state and triggers TTS playback

- UI widgets like PitchSlider, SpeedSlider, VoiceDropdown, and SpeakButton watch the state and rebuild on changes

