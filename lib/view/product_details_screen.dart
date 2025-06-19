import 'package:e_commerece/model/product.dart';
import 'package:e_commerece/utils/app_textstyle.dart';
import 'package:e_commerece/view/widgets/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenwidth = screenSize.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color:
                isDark ? Colors.white : const Color.fromARGB(255, 3, 156, 77),
          ),
        ),
        title: Text(
          'Details',
          style: AppTextstyle.withcolor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _shareProduct(
              context,
              product.name,
              product.description,
            ),
            icon: Icon(
              Icons.share,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                //image
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Favorite button
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite
                          ? Theme.of(context).primaryColor
                          : isDark
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            //productDetails
            Padding(
              padding: EdgeInsets.all(
                screenwidth * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: AppTextstyle.withcolor(
                            AppTextstyle.h2,
                            Theme.of(context).textTheme.headlineMedium!.color!,
                          ),
                        ),
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppTextstyle.withcolor(
                          AppTextstyle.h2,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    product.category,
                    style: AppTextstyle.withcolor(
                      AppTextstyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    'Select Size',
                    style: AppTextstyle.withcolor(
                      AppTextstyle.labelMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  //size selector
                  SizeSelector(),

                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    'Description',
                    style: AppTextstyle.withcolor(
                      AppTextstyle.labelMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    product.description,
                    style: AppTextstyle.withcolor(
                      AppTextstyle.bodySmall,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // buttons
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            screenwidth * 0.04,
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      side: BorderSide(
                        color: isDark ? Colors.white70 : Colors.black38,
                      )),
                  child: Text(
                    'Add to cart',
                    style: AppTextstyle.withcolor(
                      AppTextstyle.buttonMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: screenwidth * 0.04,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Buy Now',
                    style: AppTextstyle.withcolor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // share product
// share product
  Future<void> _shareProduct(
    BuildContext context,
    String productName,
    String description,
  ) async {
    // get the render box for the share position orgin(required for ipad)
    final box = context.findRenderObject() as RenderBox?;
    const String shopLink = 'https://yourshop.com//product/cotton-tshirt';
    final String shareMessage = '$description\n\nshop now at $shopLink';

    try {
      final ShareResult result = await SharePlus.instance.share(
        ShareParams(
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
          subject: productName,
          text: shareMessage,
        ),
      );
      if (result.status == ShareResultStatus.success) {
        debugPrint('Share was successful');
      } else if (result.status == ShareResultStatus.dismissed) {
        debugPrint('Share was dismissed');
      } else {
        debugPrint('Share failed');
      }
    } catch (e) {
      debugPrint('Error while sharing: $e');
    }
  }
}
