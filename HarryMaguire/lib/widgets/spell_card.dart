import 'package:flutter/material.dart';

import '../app/models/spell_model.dart';

class SpellCard extends StatelessWidget {
  final SpellModel spell;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const SpellCard({
    super.key,
    required this.spell,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      elevation: 3,
      child: ListTile(
        leading: const Icon(
          Icons.auto_awesome,
          color: Colors.deepPurple,
        ),
        title: Text(
          spell.spell,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(spell.use),
        trailing: IconButton(
          onPressed: onFavorite,
          icon: Icon(
            isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}