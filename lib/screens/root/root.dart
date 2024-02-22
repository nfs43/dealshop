import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dealshop/Utils/utils.dart';
import 'package:dealshop/main.dart';
import 'package:dealshop/notification/push_notification.dart' as pn;
import 'package:dealshop/routes/RouteGenerator.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/screens/root/widgets/Bnb/BottomBar.dart';
import 'package:dealshop/theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class RootScreen extends StatelessWidget {
  //bool isLoading = false;
  late final FirebaseMessaging _messaging;
  pn.PushNotification? _notificationInfo;
  late String token;

  RootScreen({
    Key? key,
  }) : super(key: key) {
    initFirebase();
  }

  void initFirebase() {
    registerNotification();
    checkForInitialMessage();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      pn.PushNotification notification = pn.PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      _notificationInfo = notification;
      print('initFirebase');
      //showNotification();
      Navigator.pushNamed(MyApp.navigatorKey.currentContext!, RoutesName.ProductDetails);

    });
    getToken();
  }

  void registerNotification() async {
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        pn.PushNotification notification = pn.PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );
        _notificationInfo = notification;
        showNotification();
            print('registerNotification');
            
           //Navigator.pushNamed(MyApp.navigatorKey.currentContext!, RoutesName.ProductDetails);


      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void checkForInitialMessage() async {
    //await Firebase.initializeApp();
    print('checkForInitialMessage');
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      pn.PushNotification notification = pn.PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );
      _notificationInfo = notification;
      showNotification();
    }
  }

  void showNotification() {
    print('trigger');
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'basic_channel',
      title: _notificationInfo!.title!,
      body:_notificationInfo!.body!,
      bigPicture:"https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      notificationLayout: NotificationLayout.BigPicture,
      ),
  ); 
}


  // void showNotification(){
  //    Widget productImage = Image.network(
  //         'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D',
  //         width: 100, // Adjust the width as needed
  //         height: 100, // Adjust the height as needed
  //         fit: BoxFit.cover,
  //       );
  //   showSimpleNotification(
  //     Text(_notificationInfo!.title!,style: TextStyle(color: black),),
  //     subtitle: Text(_notificationInfo!.body!,style: TextStyle(color: black),),
  //     background: white,
  //     duration: Duration(seconds: 2),
  //         leading: productImage,

  //   );
  // }


  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    print('fcmtoken:$token');
  }

  @override
  Widget build(BuildContext context) {
    //Apis.init(context);
    //DatabaseHandler.init();
    //SharedPref.init();
    return OverlaySupport(
      child: MaterialApp(
          //title: 'Deal Shop',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: RoutesName.initialScreen,
          home: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0.0,
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Colors.white,
                // Status bar brightness (optional)
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
            ),
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                SafeArea(
                  child: Scaffold(
                    bottomNavigationBar: BottomNavBar(),
                  ),
                ),
                // Consumer<ApiProvider>(
                //   builder: (BuildContext context, value, Widget? child) {
                //     WidgetsBinding.instance.addPostFrameCallback((_) {
                //       if (value.isLoaderVisible()) {
                //         if (isLoading) return;
                //         isLoading = true;
                //         showLoaderDialog(context);
                //       } else {
                //         if (!isLoading) return;
                //         isLoading = false;
                //         Navigator.pop(context);
                //       }
                //     });
                //     return const SizedBox();
                //   },
                // )
              ],
            ),
          )),
    );
  }

  // showLoaderDialog(BuildContext context) {
  //   showDialog(
  //     useSafeArea: false,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return LoadingWidget();
  //     },
  //   );
  // }
}
