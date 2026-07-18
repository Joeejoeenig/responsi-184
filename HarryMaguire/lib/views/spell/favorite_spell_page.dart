// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../app/controllers/spell_controller.dart';

// class FavoriteSpellPage extends StatelessWidget {
//   const FavoriteSpellPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<SpellController>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Favorite Spells"),
//       ),

//       body: Obx(() {

//         if (controller.favoriteList.isEmpty) {

//           return const Center(
//             child: Text("Belum ada favorite."),
//           );

//         }

//         return ListView.builder(

//           itemCount: controller.favoriteList.length,

//           itemBuilder: (_, index) {

//             final spell = controller.favoriteList[index];

//             return Card(

//               child: ListTile(

//                 title: Text(spell),

//                 trailing: IconButton(

//                   icon: const Icon(
//                     Icons.delete,
//                     color: Colors.red,
//                   ),

//                   onPressed: () {

//                     controller.favoriteList.remove(spell);

//                     controller.storage.write(
//                       "favorites",
//                       controller.favoriteList,
//                     );

//                   },

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
import '../../app/models/spell_model.dart';
import '../../widgets/spell_card.dart';

class FavoriteSpellPage extends StatelessWidget {
  const FavoriteSpellPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SpellController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Spells"),
      ),
      body: Obx(() {
        if (controller.favoriteList.isEmpty) {
          return const Center(
            child: Text("Belum ada favorite."),
          );
        }

        return ListView.builder(
          itemCount: controller.favoriteList.length,
          itemBuilder: (context, index) {
            final SpellModel spell = controller.favoriteList[index];

            return SpellCard(
              spell: spell,
              isFavorite: true,
              onFavorite: () {
                controller.removeFavorite(spell);
              },
            );
          },
        );
      }),
    );
  }
}