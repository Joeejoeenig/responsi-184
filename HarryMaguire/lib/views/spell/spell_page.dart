// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../app/controllers/spell_controller.dart';

// class SpellPage extends StatelessWidget {
//   const SpellPage({super.key});

//   @override
//   Widget build(BuildContext context) {

//     final controller = Get.find<SpellController>();

//     return Scaffold(

//       appBar: AppBar(
//         title: const Text("Harry Potter Spells"),
//       ),

//       body: Obx(() {

//         if (controller.isLoading.value) {

//           return const Center(
//             child: CircularProgressIndicator(),
//           );

//         }

//         return ListView.builder(

//           itemCount: controller.spellList.length,

//           itemBuilder: (context, index) {

//             final spell = controller.spellList[index];

//             return Card(

//               margin: const EdgeInsets.all(10),

//               child: ListTile(

//                 leading: const Icon(
//                   Icons.auto_awesome,
//                   color: Colors.deepPurple,
//                 ),

//                 title: Text(
//                   spell.spell,
//                 ),

//                 subtitle: Text(
//                   spell.use,
//                 ),

//               ),

//             );

//           },

//         );

//       }),

//     );

//   }

// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/controllers/spell_controller.dart';
import '../../app/routes/app_routes.dart';
import '../../widgets/spell_card.dart';

class SpellPage extends StatelessWidget {
  const SpellPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SpellController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Harry Potter Spells"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.favorite);
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.spellList.isEmpty) {
          return const Center(
            child: Text("Tidak ada data spell."),
          );
        }

        return ListView.builder(
          itemCount: controller.spellList.length,
          itemBuilder: (context, index) {
            final spell = controller.spellList[index];

            return SpellCard(
              spell: spell,
              isFavorite: controller.isFavorite(spell.spell),
              onFavorite: () {
                controller.toggleFavorite(spell);
              },
            );
          },
        );
      }),
    );
  }
}