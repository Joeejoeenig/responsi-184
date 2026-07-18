// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../routes/app_routes.dart';

// class AuthController extends GetxController {
//   final GetStorage storage = GetStorage();

//   final username = ''.obs;
//   final isLoggedIn = false.obs;

//   @override
//   void onInit() {
//     super.onInit();

//     isLoggedIn.value = storage.read('isLoggedIn') ?? false;
//     username.value = storage.read('username') ?? '';
//   }

//   void login({
//     required String username,
//     required String password,
//   }) {
//     if (username.length < 5) {
//       Get.snackbar(
//         "Login Gagal",
//         "Username minimal 5 karakter",
//       );
//       return;
//     }

//     if (password != "123230184") {
//       Get.snackbar(
//         "Login Gagal",
//         "Password (NIM) salah",
//       );
//       return;
//     }

//     this.username.value = username;
//     isLoggedIn.value = true;

//     storage.write("username", username);
//     storage.write("isLoggedIn", true);

//     Get.offAllNamed(Routes.home);
//   }

//   void logout() {
//     storage.erase();

//     username.value = '';
//     isLoggedIn.value = false;

//     Get.offAllNamed(Routes.login);
//   }
// }

// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../routes/app_routes.dart';

// class AuthController extends GetxController {
//   final _storage = GetStorage();

//   static const String nim = "123230184";

//   final RxString username = "".obs;
//   final RxBool isLoggedIn = false.obs;

//   @override
//   void onInit() {
//     super.onInit();

//     username.value = _storage.read("username") ?? "";
//     isLoggedIn.value = _storage.read("isLoggedIn") ?? false;
//   }

//   void checkLogin() {
//     Future.delayed(const Duration(seconds: 2), () {
//       if (isLoggedIn.value) {
//         Get.offAllNamed(Routes.home);
//       } else {
//         Get.offAllNamed(Routes.login);
//       }
//     });
//   }

//   void login({
//     required String username,
//     required String password,
//   }) {
//     if (username.length < 5) {
//       Get.snackbar(
//         "Login Gagal",
//         "Username minimal 5 karakter",
//       );
//       return;
//     }

//     if (password != nim) {
//       Get.snackbar(
//         "Login Gagal",
//         "Password harus berupa NIM",
//       );
//       return;
//     }

//     this.username.value = username;
//     isLoggedIn.value = true;

//     _storage.write("username", username);
//     _storage.write("isLoggedIn", true);

//     Get.offAllNamed(Routes.home);
//   }

//   void logout() {
//     _storage.erase();

//     username.value = "";
//     isLoggedIn.value = false;

//     Get.offAllNamed(Routes.login);
//   }
// }

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final GetStorage storage = GetStorage();

  static const String nim = "123230184";

  final username = ''.obs;
  final isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();

    username.value = storage.read("username") ?? "";
    isLoggedIn.value = storage.read("isLoggedIn") ?? false;
  }

  void checkLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      if (isLoggedIn.value) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }

  bool login({
    required String username,
    required String password,
  }) {
    if (username.length < 5) {
      Get.snackbar(
        "Login Gagal",
        "Username minimal 5 karakter",
      );
      return false;
    }

    if (password != nim) {
      Get.snackbar(
        "Login Gagal",
        "Password harus berupa NIM",
      );
      return false;
    }

    this.username.value = username;
    isLoggedIn.value = true;

    storage.write("username", username);
    storage.write("isLoggedIn", true);

    Get.offAllNamed(Routes.home);

    return true;
  }

  void logout() {
    storage.erase();

    username.value = "";
    isLoggedIn.value = false;

    Get.offAllNamed(Routes.login);
  }
}