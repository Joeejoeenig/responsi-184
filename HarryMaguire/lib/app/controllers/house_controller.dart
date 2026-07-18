import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/house_model.dart';
import '../services/api_service.dart';

class HouseController extends GetxController {
  final ApiService api = ApiService();
  final GetStorage storage = GetStorage();

  var houseList = <HouseModel>[].obs;
  var selectedHouse = Rxn<HouseModel>();

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    loadSelectedHouse();
    getHouses();
  }

  Future<void> getHouses() async {
    try {
      isLoading(true);

      final result = await api.getHouses();

      houseList.assignAll(result);
    } finally {
      isLoading(false);
    }
  }

  void selectHouse(HouseModel house) {
    selectedHouse.value = house;

    storage.write(
      "selectedHouse",
      jsonEncode(house.toJson()),
    );
  }

  void loadSelectedHouse() {
    final data = storage.read("selectedHouse");

    if (data != null) {
      selectedHouse.value =
          HouseModel.fromJson(jsonDecode(data));
    }
  }
}