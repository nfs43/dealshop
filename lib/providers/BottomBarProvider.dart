// ignore_for_file: camel_case_types

import 'package:dealshop/screens/Home/home.dart';
import 'package:dealshop/screens/cart.dart';
import 'package:dealshop/screens/creator.dart';
import 'package:dealshop/screens/feed.dart';
import 'package:dealshop/screens/orderReview.dart';
import 'package:dealshop/screens/profile.dart';
import 'package:dealshop/screens/root/widgets/Bnb/BottomBarTab.dart';
import 'package:dealshop/screens/shippingDetails.dart';
import 'package:dealshop/screens/storeDetail.dart';
import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int _currentTab = 0;
  Widget _screen = Home();
  bool _hide = false;

  final List<Widget> screens = [
    StoreDetail(),
    Feeds(),
    AddCreator(),
    Cart(),
    Profile(),
  ];

  final List<MyTabItem> _bottombaritems = [
    MyTabItem('Shop', Icons.shopping_bag_outlined),
    MyTabItem('Feed', Icons.feed),
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
