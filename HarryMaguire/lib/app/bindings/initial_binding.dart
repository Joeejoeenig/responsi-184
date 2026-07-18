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
      fenix: true,
    );

    Get.lazyPut<SpellController>(
      () => SpellController(),
      fenix: true,
    );

    Get.lazyPut<HouseController>(
      () => HouseController(),
      fenix: true,
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
      fenix: true,
    );

  }
}