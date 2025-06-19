import 'package:e_commerece/features/notifications/model/notification_type.dart';
import 'package:flutter/material.dart';

class NotificationUtils {
  static IconData getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return Icons.shopping_bag_outlined;
      case NotificationType.delivey:
        return Icons.local_shipping_outlined;

      case NotificationType.promo:
        return Icons.local_offer_outlined;
      case NotificationType.payment:
        return Icons.payment_outlined;
    }
  }

  static Color getIConBackgroundColor(
    BuildContext context,
    NotificationType type,
  ) {
    switch (type) {
      case NotificationType.order:
        return Theme.of(context).primaryColor;
      case NotificationType.delivey:
        return Colors.green[100]!;
      case NotificationType.promo:
        return Colors.orange[100]!;
      case NotificationType.payment:
        return Colors.red[100]!;
    }
  }

  static Color getIconColor(BuildContext context, NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return Colors.white;
      case NotificationType.delivey:
        return Colors.green;
      case NotificationType.promo:
        return Colors.orange;
      case NotificationType.payment:
        return Colors.red;
    }
  }
}
