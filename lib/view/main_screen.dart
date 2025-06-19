import 'package:e_commerece/controller/navigation_controller.dart';
import 'package:e_commerece/controller/theme_controller.dart';
import 'package:e_commerece/view/account_screen.dart';
import 'package:e_commerece/view/home_screen.dart';
import 'package:e_commerece/view/shopping_screen.dart';
import 'package:e_commerece/view/widgets/custom_bottom_navigation.dart';
import 'package:e_commerece/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Make sure this is the correct import

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();

    return GetBuilder<ThemeController>(
      builder: (themeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnimatedSwitcher(
          duration: Duration(
            milliseconds: 200,
          ),
          child: Obx(() => IndexedStack(
                key: ValueKey(navigationController.currentIndex.value),
                index: navigationController.currentIndex.value,
                children: [
                  HomeScreen(),
                  ShoppingScreen(),
                  WishlistScreen(),
                  AccountScreen()
                ],
              )),
        ),
        bottomNavigationBar: CustomBottomNavbar(),
      ),
    );
  }
}
