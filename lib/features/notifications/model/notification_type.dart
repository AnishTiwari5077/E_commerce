enum NotificationType { order, delivey, promo, payment }

class NotificationItem {
  final String title;
  final String message;
  final NotificationType type;
  final bool isRead;
  final String time;

  NotificationItem({
    required this.title,
    required this.message,
    required this.type,
    required this.time,
    this.isRead = false,
  });
}
