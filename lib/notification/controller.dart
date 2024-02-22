
// Define a class to handle notification events
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dealshop/main.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:flutter/material.dart';

class NotificationsController {
  // Method to handle when a new notification or schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code to handle notification creation
        print('onNotificationCreatedMethod');

  }

  // Method to handle when a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code to handle notification display
    print('onNotificationDisplayedMethod');


  }

  // Method to handle if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code to handle notification dismissal
            print('onDismissActionReceivedMethod');

  }

  // Method to handle when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code to handle notification action
    // Navigate to different pages or perform actions based on the received action
    // For example:
     MyApp.navigatorKey.currentState?.pushNamed(RoutesName.ProductDetails);
                print('onActionReceivedMethod');

  }

    static Future<void> initializeNotificationsEventListeners() async {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationsController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationsController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationsController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationsController.onDismissActionReceivedMethod);
  }
}