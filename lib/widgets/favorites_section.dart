// favorites_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_it_right/providers/speech_notifier.dart';
import 'favorite_item_tile.dart';

class FavoritesSection extends ConsumerWidget {
  const FavoritesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(
      speechNotifierProvider.select((state) => state.favorites),
    );
    final onItemTap = ref.read(speechNotifierProvider.notifier).updateText;
    final onFavoriteTap = ref
        .read(speechNotifierProvider.notifier)
        .removeFromFavorites;

    if (items.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Favorites",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        ...items.map(
          (item) => FavoriteItemTile(
            text: item,
            onTap: () => onItemTap(item),
            onFavoriteTap: () => onFavoriteTap(item),
          ),
        ),
      ],
    );
  }
}
