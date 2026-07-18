import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String username;

  const ProfileAvatar({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 45,
      backgroundColor: Colors.deepPurple,
      child: Text(
        username.isNotEmpty
            ? username[0].toUpperCase()
            : "?",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}