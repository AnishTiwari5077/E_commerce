import 'package:e_commerece/features/notifications/model/notification_type.dart';

class NotificationRepositroy {
  List<NotificationItem> getNotifications() {
    return [
      NotificationItem(
        title: ' Order Received',
        message: 'You have hase been order',
        type: NotificationType.order,
        time: '2 min ago',
        isRead: true,
      ),
      NotificationItem(
        title: 'special Offer',
        message: 'Get 20% off on your first order',
        type: NotificationType.promo,
        time: '1 hour ago',
        isRead: true,
      ),
      NotificationItem(
        title: 'out of delivery',
        message: 'You order is out of delivery',
        type: NotificationType.delivey,
        time: '2 min ago',
        isRead: true,
      ),
      NotificationItem(
        title: 'payment sucessful',
        message: 'payment was  sucessful',
        type: NotificationType.payment,
        time: '2 min ago',
        isRead: true,
      ),
    ];
  }
}
