import 'package:flutter/material.dart';
import 'favorite_item_tile.dart';

class FavoritesSection extends StatelessWidget {
  const FavoritesSection({
    super.key,
    required this.items,
    required this.onItemTap,
    required this.onFavoriteTap,
  });

  final List<String> items;

  final ValueChanged<String> onItemTap;
  final ValueChanged<String> onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox();
    }

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
