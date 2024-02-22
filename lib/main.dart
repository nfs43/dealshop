// ignore_for_file: prefer_const_constructors

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dealshop/notification/controller.dart';
import 'package:dealshop/providers/BottomBarProvider.dart';
import 'package:dealshop/providers/videoplayerProvider.dart';
import 'package:dealshop/routes/RouteGenerator.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // AwesomeNotifications().initialize(
  //   '',
  //   [
  //     NotificationChannel(
  //       channelKey: 'general_channel',
  //       channelName: 'General notifications',
  //       channelDescription:
  //           'General notifications for updates and announcements',
  //       importance: NotificationImportance.High,
  //       playSound: true,
  //       defaultColor: Color(0xFF9D50DD),
  //       ledColor: Colors.white,
  //     ),
  //   ],
  // );

  //NotificationsController.initializeNotificationsEventListeners();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BottomBarProvider()),
    ChangeNotifierProvider(create: (context) => VideoPlayerProvider()),
  ], child: MyApp()));
  
}

class MyApp extends StatefulWidget {

   // The navigator key is necessary to navigate using static methods
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Only after at least the action method is set, the notification events are delivered
    //NotificationsController.initializeNotificationsEventListeners();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DealShop',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.initialScreen,
      navigatorKey: MyApp.navigatorKey,
    );
  }
}
