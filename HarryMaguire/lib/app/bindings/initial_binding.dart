import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/house_controller.dart';
import '../controllers/profile_controller.dart';
import '../controllers/spell_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<AuthController>(
      () => AuthController(),
    );

    Get.lazyPut<SpellController>(
      () => SpellController(),
    );

    Get.lazyPut<HouseController>(
      () => HouseController(),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );

  }
}