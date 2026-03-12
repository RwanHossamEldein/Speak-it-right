Speak It Right 🗣️

Description:
A Flutter app/feature demonstrating Text-to-Speech (TTS) with Riverpod state management. Users can type text, adjust pitch and speed, select a voice, and save their favorite phrases. Ideal as a learning project for practicing Flutter widgets, state management, and TTS integration.

Features ✅

Input text for speech.

Adjust speech speed and pitch with sliders.

Select voice from available TTS options.

Save favorite phrases and replay them.

Play/Pause TTS.

Fully implemented using Riverpod for state management.

Screenshots / Demo 🎬

(Insert screenshots or record a short video GIF showing input, sliders, dropdown, and TTS in action.)


Getting Started 🚀
Prerequisites

Flutter SDK >= 3.0

Dart >= 2.18

Installation

1-Clone the repo:
git clone https://github.com/your-username/speak_it_right.git
2-Install dependencies:
flutter pub get
3-Run the app:
flutter run


Packages Used 📦

-flutter_riverpod – state management

-flutter_tts – text-to-speech

How it Works 🛠️

Riverpod manages SpeechState (text, pitch, speed, voice, favorites, isSpeaking).

SpeechNotifier updates state and triggers TTS playback.

UI widgets (PitchSlider, SpeedSlider, VoiceDropdown, SpeakButton) watch state and rebuild on changes.
 
