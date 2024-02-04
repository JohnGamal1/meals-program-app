import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../screens/program_screens/programs_screen.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PersistentTabController(initialIndex: 1);
    final screens = [
      const Placeholder(),
      const ProgramsScreen(),
      const Placeholder(),
      const Placeholder(),
    ];
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_outlined),
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.white70,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_2_outlined),
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.white70,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.receipt_long_rounded),
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.white70,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart_outlined),
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.white70,
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: Colors.black87,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(30.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      margin: const EdgeInsets.all(25),
      padding: const NavBarPadding.all(10),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
