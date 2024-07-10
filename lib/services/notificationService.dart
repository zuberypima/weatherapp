import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TrigerNotificatin {
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await FlutterLocalNotificationsPlugin().show(
      0,
      'Hello, World!',
      'This is a simple notification',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}
