import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/controllers/profile_controller.dart';
import '../../widgets/profile_avatar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ProfileAvatar(
                username: controller.authController.username.value,
              ),

              const SizedBox(height: 20),

              Text(
                controller.authController.username.value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Card(
              //   child: ListTile(
              //     leading: const Icon(Icons.home),
              //     title: const Text("Selected House"),
              //     subtitle: Text(
              //       controller.houseController.selectedHouse.value?.house ??
              //           "Belum memilih House",
              //     ),
              //   ),
              // ),

              Card(
                child: ListTile(
                  leading: Text(
                    controller.houseController.selectedHouse.value?.emoji ?? "🏰",
                    style: const TextStyle(fontSize: 30),
                    ),
                  
                  title: Text(
                    controller.houseController.selectedHouse.value?.house ??
                    "Broken Home",
                    ),
                  
                  subtitle: Text(
                    controller.houseController.selectedHouse.value?.founder ?? "",
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Card(
                child: ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text("Kesan"),
                  subtitle: Text(
                    "Keren Cik",
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Card(
                child: ListTile(
                  leading: Icon(Icons.message),
                  title: Text("Pesan"),
                  subtitle: Text(
                    "Semoga praktikum tahun depan lebih menantang untuk adik adik",
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.authController.logout();
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}