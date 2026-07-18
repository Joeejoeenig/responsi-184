import 'package:get/get.dart';

import '../../views/home/home_page.dart';
import '../../views/house/house_page.dart';
import '../../views/login/login_page.dart';
import '../../views/profile/profile_page.dart';
import '../../views/spell/favorite_spell_page.dart';
import '../../views/spell/spell_page.dart';
import '../../views/splash/splash_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
    ),

    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
    ),

    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),

    GetPage(
      name: Routes.spells,
      page: () => const SpellPage(),
    ),

    GetPage(
      name: Routes.favorite,
      page: () => const FavoriteSpellPage(),
    ),

    GetPage(
      name: Routes.houses,
      page: () => const HousePage(),
    ),

    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
    ),
  ];
}