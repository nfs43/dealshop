// ignore_for_file: camel_case_types




import 'package:dealshop/screens/Home.dart';
import 'package:dealshop/screens/orderReview.dart';
import 'package:dealshop/screens/root/widgets/Bnb/BottomBarTab.dart';
import 'package:dealshop/screens/shippingDetails.dart';
import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int _currentTab = 0;
  Widget _screen = HomeScreen();
  bool _hide = false;


  final List<Widget> screens = [
    orderReview(),
    //HomeScreen(),
    ShippingDetails(),
    Container(),
    Container(),
    Container()
  ];

  final List<MyTabItem> _bottombaritems = [
    MyTabItem('Home', Icons.home_outlined),
    MyTabItem('Categories', Icons.local_offer_outlined),
    MyTabItem('Creators', Icons.add),
    MyTabItem('Cart', Icons.shopping_cart_outlined),
    MyTabItem('Profile', Icons.person_pin),
  ];

  get getbottombaritems => _bottombaritems;

  set screen(screen) {
    _screen = screen;
    notifyListeners();
  }

  get screen => _screen;

  void hideBottomBar(bool hide) {
    _hide = hide;
    notifyListeners();
  }

  get hide => _hide;
}
