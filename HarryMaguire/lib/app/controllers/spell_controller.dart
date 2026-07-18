// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../models/spell_model.dart';
// import '../services/api_service.dart';

// class SpellController extends GetxController {
//   final ApiService api = ApiService();
//   final GetStorage storage = GetStorage();

//   var spellList = <SpellModel>[].obs;
//   var favoriteList = <String>[].obs;

//   var isLoading = true.obs;

//   @override
//   void onInit() {
//     super.onInit();

//     favoriteList.value =
//         List<String>.from(storage.read("favorites") ?? []);

//     getSpells();
//   }

//   Future<void> getSpells() async {
//     try {
//       isLoading(true);

//       final result = await api.getSpells();

//       spellList.assignAll(result);
//     } finally {
//       isLoading(false);
//     }
//   }

//   bool isFavorite(String spell) {
//     return favoriteList.contains(spell);
//   }

//   void toggleFavorite(SpellModel spell) {
//     if (favoriteList.contains(spell.spell)) {
//       favoriteList.remove(spell.spell);
//     } else {
//       favoriteList.add(spell.spell);
//     }

//     storage.write("favorites", favoriteList);
//   }
// }

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/spell_model.dart';
import '../services/api_service.dart';

class SpellController extends GetxController {
  final ApiService api = ApiService();
  final GetStorage storage = GetStorage();

  var spellList = <SpellModel>[].obs;
  var favoriteList = <SpellModel>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    loadFavorites();
    getSpells();
  }

  Future<void> getSpells() async {
    try {
      isLoading(true);

      final result = await api.getSpells();
      spellList.assignAll(result);
    } finally {
      isLoading(false);
    }
  }

  // =========================
  // FAVORITE
  // =========================

  void loadFavorites() {
    final data = storage.read("favorites");

    if (data != null) {
      final List decoded = jsonDecode(data);

      favoriteList.assignAll(
        decoded.map((e) => SpellModel.fromJson(e)).toList(),
      );
    }
  }

  void saveFavorites() {
    final data =
        favoriteList.map((e) => e.toJson()).toList();

    storage.write(
      "favorites",
      jsonEncode(data),
    );
  }

  bool isFavorite(String spellName) {
    return favoriteList.any(
      (spell) => spell.spell == spellName,
    );
  }

  void toggleFavorite(SpellModel spell) {
    if (isFavorite(spell.spell)) {
      favoriteList.removeWhere(
        (item) => item.spell == spell.spell,
      );
    } else {
      favoriteList.add(spell);
    }

    saveFavorites();
  }

  void removeFavorite(SpellModel spell) {
    favoriteList.removeWhere(
      (item) => item.spell == spell.spell,
    );

    saveFavorites();
  }
}