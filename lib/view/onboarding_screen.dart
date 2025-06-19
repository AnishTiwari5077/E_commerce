import 'package:e_commerece/controller/auth_controller.dart';
import 'package:e_commerece/utils/app_textstyle.dart';
import 'package:e_commerece/view/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _items = [
    OnboardingItem(
      image: 'assets/images/intro.png',
      title: 'Discover Latest Trends',
      description:
          'Explore the newest fasion and trends and find your unique style',
    ),
    OnboardingItem(
      image: 'assets/images/intro.png',
      title: 'Quality products',
      description: 'Shop premium quality products from top brands worldwide',
    ),
    OnboardingItem(
      image: 'assets/images/intro2.png',
      title: 'Easy shopping',
      description: 'Simple and secure shopping experinces at your fingertips',
    ),
  ];

  // Handle Get started butoon
  void _handleGetStarted() {
    final AuthController authController = Get.find<AuthController>();
    authController.setFirstTimeDone();
    Get.off(() => SigninScreen());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    _items[index].title,
                    style: AppTextstyle.withcolor(
                      AppTextstyle.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      _items[index].description,
                      style: AppTextstyle.withcolor(
                        AppTextstyle.bodyLarge,
                        isDark ? Colors.blueGrey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: Duration(
                    milliseconds: 300,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: _currentPage == index
                          ? Theme.of(context).primaryColor
                          : (isDark ? Colors.grey[700] : Colors.grey[300])),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _handleGetStarted(),
                  child: Text(
                    'Skip',
                    style: AppTextstyle.withcolor(AppTextstyle.buttonMedium,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _items.length - 1) {
                      _pageController.nextPage(
                          duration: Duration(microseconds: 300),
                          curve: Curves.easeInOut);
                    } else {
                      _handleGetStarted();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 32,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text(
                    _currentPage < _items.length - 1 ? 'Next' : 'Get Started',
                    style: AppTextstyle.withcolor(
                        AppTextstyle.buttonMedium, Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
  final String image;
  final String title;
  final String description;
}
