
import 'package:dealshop/routes/RouteGenerator.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/screens/root/widgets/Bnb/BottomBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

class RootScreen extends StatelessWidget {
  //bool isLoading = false;

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
