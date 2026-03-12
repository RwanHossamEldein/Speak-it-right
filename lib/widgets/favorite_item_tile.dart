// favorite_item_tile.dart
import 'package:flutter/material.dart';

class FavoriteItemTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const FavoriteItemTile({
    super.key,
    required this.text,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.star, color: Colors.amber),
            onPressed: onFavoriteTap,
          ),
        ],
      ),
    );
  }
}
