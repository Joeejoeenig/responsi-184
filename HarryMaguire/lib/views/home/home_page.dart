import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/controllers/auth_controller.dart';
import '../../app/routes/app_routes.dart';
import '../../widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Harry Potter App"),

        actions: [
          IconButton(
            onPressed: () {
              auth.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Obx(
              () => Text(
                "Welcome, ${auth.username.value} 👋",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            MenuCard(
              icon: Icons.auto_awesome,
              title: "Spells",
              onTap: () {
                Get.toNamed(Routes.spells);
              },
            ),

            MenuCard(
              icon: Icons.castle,
              title: "Houses",
              onTap: () {
                Get.toNamed(Routes.houses);
              },
            ),

            MenuCard(
              icon: Icons.person,
              title: "Profile",
              onTap: () {
                Get.toNamed(Routes.profile);
              },
            ),

          ],
        ),
      ),
    );
  }
}