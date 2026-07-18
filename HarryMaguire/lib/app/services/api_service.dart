import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/spell_model.dart';

class ApiService {

  static const String spellUrl =
      "https://potterapi-fedeperin.vercel.app/en/spells";

  Future<List<SpellModel>> getSpells() async {

    final response = await http.get(Uri.parse(spellUrl));

    if (response.statusCode == 200) {

      final List data = jsonDecode(response.body);

      return data
          .map((e) => SpellModel.fromJson(e))
          .toList();

    } else {

      throw Exception("Failed");

    }
  }
}