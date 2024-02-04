import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppNavigation {
  AppNavigation._();

  static final instance = AppNavigation._();

  Future<void> navigateToWithNavBar(
      BuildContext context, Widget screen) async {
    await PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: screen,
      withNavBar: true,
    );
  }

  Future<void> navigateToWithoutNavBar(
      BuildContext context, Widget screen) async {
    await PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: screen,
      withNavBar: false,
    );
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
