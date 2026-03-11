import 'package:flutter/material.dart';

class VoiceDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  //?
  final ValueChanged<String?> onChanged;

  const VoiceDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
      value: value,
      hint: Text("Language & Voice"),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
