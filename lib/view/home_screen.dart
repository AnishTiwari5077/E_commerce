import 'package:e_commerece/controller/theme_controller.dart';
import 'package:e_commerece/features/notifications/notification_screen.dart';
import 'package:e_commerece/view/all_product_screen.dart';
import 'package:e_commerece/view/cart_screen.dart';
import 'package:e_commerece/view/widgets/category_chips.dart';
import 'package:e_commerece/view/widgets/custom_search_bar.dart';
import 'package:e_commerece/view/widgets/product_grid.dart';
import 'package:e_commerece/view/widgets/sale_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello sagar',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'Good Morning',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Get.to(() => NotificationScreen()),
                      icon: const Icon(Icons.notifications_outlined),
                    ),
                    IconButton(
                      onPressed: () => Get.to(() => CartScreen()),
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                    GetBuilder<ThemeController>(
                      builder: (controller) => IconButton(
                        onPressed: () => controller.toggleTheme(),
                        icon: Icon(
                          controller.isDarkMode
                              ? Icons.light_mode
                              : Icons.dark_mode,
                        ),
                      ),
                    ),
                  ],
                ),
                //  const SizedBox(height: 16),

                // Search Bar
                const CustomSearchBar(),
                // const SizedBox(height: 16),

                // Category Chips
                const CategoryChips(),
                //    const SizedBox(height: 16),

                // Sale Banner
                const SaleBanner(),
                //popolar product
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular product',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => AllProductScreen()),
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //product grid
                SizedBox(height: 400, child: ProductGrid()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
