import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  bool isNotificationEnabled = true;

  @override
  void onInit() {
    super.onInit();
    _loadNotificationPreference();
  }

  void toggleNotification(bool value) async {
    isNotificationEnabled = value;
    update(); // updates GetBuilder listeners
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notifications_enabled', value);
  }

  void _loadNotificationPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isNotificationEnabled = prefs.getBool('notifications_enabled') ?? true;
    update(); // make sure UI reflects the loaded value
  }
}
