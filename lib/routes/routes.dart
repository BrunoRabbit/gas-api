import 'package:flutter/material.dart';
import 'package:gas_api/view/cart_view.dart';
import 'package:gas_api/view/home_view.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> path = {
    RoutesPath.homeView: (_) => const HomeView(),
    RoutesPath.cartView: (_) => const CartView(),
  };
}

class RoutesPath {
  static const homeView = '/home-view';
  static const cartView = '/cart-view';
}
