// ignore_for_file: prefer_const_constructors

import 'package:dealshop/providers/BottomBarProvider.dart';
import 'package:dealshop/providers/videoplayerProvider.dart';
import 'package:dealshop/routes/RouteGenerator.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BottomBarProvider()),
    ChangeNotifierProvider(create: (context) => VideoPlayerProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DealShop',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.initialScreen,
    );
  }
}
