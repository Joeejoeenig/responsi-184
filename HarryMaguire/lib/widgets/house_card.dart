import 'package:flutter/material.dart';

import '../app/models/house_model.dart';

class HouseCard extends StatelessWidget {
  final HouseModel house;
  final bool isSelected;
  final VoidCallback onTap;

  const HouseCard({
    super.key,
    required this.house,
    required this.isSelected,
    required this.onTap,
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
        leading: Text(
          house.emoji,
          style: const TextStyle(fontSize: 28),
        ),
        title: Text(
          house.house,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Founder: ${house.founder}",
        ),
        trailing: isSelected
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}