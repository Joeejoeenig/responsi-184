import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/controllers/house_controller.dart';
import '../../widgets/house_card.dart';

class HousePage extends StatelessWidget {
  const HousePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HouseController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Harry Potter Houses"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.houseList.isEmpty) {
          return const Center(
            child: Text("Tidak ada data house."),
          );
        }

        return ListView.builder(
          itemCount: controller.houseList.length,
          itemBuilder: (context, index) {
            final house = controller.houseList[index];

            return HouseCard(
              house: house,
              isSelected:
                  controller.selectedHouse.value?.house == house.house,
              onTap: () {
                controller.selectHouse(house);

                Get.snackbar(
                  "House Dipilih",
                  "Kamu memilih ${house.house}",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2),
                );
              },
            );
          },
        );
      }),
    );
  }
}