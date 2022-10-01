import 'package:flutter_steps_tracker/app/pages/auth_dispatcher/controller.dart';
import 'package:flutter_steps_tracker/app/pages/auth_dispatcher/view.dart';
import 'package:flutter_steps_tracker/app/pages/home_page/controller.dart';
import 'package:flutter_steps_tracker/app/pages/home_page/rewards_catalog_screen_controller.dart';
import 'package:flutter_steps_tracker/app/pages/home_page/view.dart';
import 'package:flutter_steps_tracker/app/pages/home_page/wallet_screen_controller.dart';
import 'package:flutter_steps_tracker/app/pages/sign_up/controller.dart';
import 'package:flutter_steps_tracker/app/pages/sign_up/view.dart';
import 'package:flutter_steps_tracker/app/pages/splash_screen/view.dart';
import 'package:get/get.dart';

final routes = <GetPage>[
  GetPage(
    name: '/splash',
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: '/auth_dispatcher',
    page: () => const AuthDispatcherPage(),
    binding: BindingsBuilder.put(() => AuthDispatcherController()),
  ),
  GetPage(
    name: '/signup',
    page: () => const SignUpPage(),
    binding: BindingsBuilder.put(() => SignupController()),
  ),
  GetPage(
    name: "/home_page",
    page: () => const HomePage(),
    binding: BindingsBuilder(() {
      Get.put(HomePageController());
      Get.put(RewardsCatalogScreenController());
      Get.put(WalletScreenController());
    }),
  ),
];
