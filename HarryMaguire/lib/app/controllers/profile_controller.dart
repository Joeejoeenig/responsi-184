import 'package:get/get.dart';

import 'auth_controller.dart';
import 'house_controller.dart';

class ProfileController extends GetxController {
  final authController = Get.find<AuthController>();
  final houseController = Get.find<HouseController>();
}