// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../routes/app_routes.dart';

// class AuthController extends GetxController {

//   final GetStorage storage = GetStorage();

//   final RxString username = ''.obs;

//   final RxBool isLoggedIn = false.obs;

//   @override
//   void onInit() {
//     super.onInit();

//     isLoggedIn.value = storage.read('isLoggedIn') ?? false;

//     username.value = storage.read('username') ?? '';
//   }

//   void login(String user) {

//     username.value = user;

//     isLoggedIn.value = true;

//     storage.write('username', user);

//     storage.write('isLoggedIn', true);

//     Get.offAllNamed(Routes.home);

//   }

//   void logout() {

//     storage.erase();

//     username.value = '';

//     isLoggedIn.value = false;

//     Get.offAllNamed(Routes.login);

//   }

// }

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final GetStorage storage = GetStorage();

  final username = ''.obs;
  final isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();

    isLoggedIn.value = storage.read('isLoggedIn') ?? false;
    username.value = storage.read('username') ?? '';
  }

  void login({
    required String username,
    required String password,
  }) {
    if (username.length < 5) {
      Get.snackbar(
        "Login Gagal",
        "Username minimal 5 karakter",
      );
      return;
    }

    // GANTI DENGAN NIM KAMU
    if (password != "123230184") {
      Get.snackbar(
        "Login Gagal",
        "Password (NIM) salah",
      );
      return;
    }

    this.username.value = username;
    isLoggedIn.value = true;

    storage.write("username", username);
    storage.write("isLoggedIn", true);

    Get.offAllNamed(Routes.home);
  }

  void logout() {
    storage.erase();

    username.value = '';
    isLoggedIn.value = false;

    Get.offAllNamed(Routes.login);
  }
}