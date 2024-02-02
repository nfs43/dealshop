import 'package:dealshop/routes/GeneratePageRoute.dart';
import 'package:dealshop/routes/Routes.dart';
import 'package:dealshop/screens/AllProducts.dart';
import 'package:dealshop/screens/cart.dart';
import 'package:dealshop/screens/invoicereceipt.dart';
import 'package:dealshop/screens/ProductDetails.dart';
import 'package:dealshop/screens/orderReview.dart';
import 'package:dealshop/screens/root/root.dart';
import 'package:dealshop/screens/shippingDetails.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.initialScreen:
        return GeneratePageRoute(
            widget: RootScreen(), routeName: settings.name);
      case RoutesName.invoiceReceipt:
        return GeneratePageRoute(
            widget: ShoppingReceipt(),
            routeName: settings.name,
            args: settings.arguments as Map<String, dynamic>);
      case RoutesName.ProductDetails:
        return GeneratePageRoute(
            widget: ProductDetails(), routeName: settings.name);
      case RoutesName.AllProducts:
        return GeneratePageRoute(
            widget: AllProducts(), routeName: settings.name);
      case RoutesName.ShippingDetails:
        return GeneratePageRoute(
            widget: ShippingDetails(), routeName: settings.name);
      case RoutesName.OrderReview:
        return GeneratePageRoute(
            widget: orderReview(), routeName: settings.name);
      // case RoutesName.inboxPage:
      //   return GeneratePageRoute(
      //       widget: WishListScreen(), routeName: settings.name);
      // case RoutesName.profilePage:
      //   return GeneratePageRoute(
      //       widget: WishListScreen(), routeName: settings.name);
      // case RoutesName.storeDetailPage:
      //   return GeneratePageRoute(
      //       widget: StoreDetailScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, dynamic>);
      // case RoutesName.portfolioComments:
      //   return GeneratePageRoute(
      //       widget: PortfolioCommentsScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, dynamic>);
      // case RoutesName.searchExplorePage:
      //   return GeneratePageRoute(
      //       widget: FilterScreen(), routeName: settings.name);
      // case RoutesName.appointmentbookingPage:
      //   return GeneratePageRoute(
      //       widget: AppointmentBookingPage(), routeName: settings.name);
      // case RoutesName.signInPage:
      //   return GeneratePageRoute(
      //       widget: SignInScreen(), routeName: settings.name);
      // case RoutesName.signUpPage:
      //   return GeneratePageRoute(
      //       widget: SignupScreen(), routeName: settings.name);
      // case RoutesName.favStoresPage:
      //   return GeneratePageRoute(
      //       widget: WishlistStoreScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, String>);
      // case RoutesName.bookservicesWebviewPage:
      //   return GeneratePageRoute(
      //       widget: BookServicesPage(),
      //       routeName: settings.name,
      //       args: {'Storedetails': Data} );
      // case RoutesName.privacypolicyWebviewPagePage:
      //   return GeneratePageRoute(
      //       widget: PrivacyPolicyPage(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, String>);
      // case RoutesName.profiledetailPage:
      //   return GeneratePageRoute(
      //       widget: ProfileDetailScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, String>);
      default:
        return GeneratePageRoute(widget: Cart(), routeName: settings.name);
    }
  }
}
