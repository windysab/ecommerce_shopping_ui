import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce_shopping_ui/pages/cart_screen.dart';
import 'package:ecommerce_shopping_ui/pages/profil_screen.dart';
import 'package:ecommerce_shopping_ui/pages/setting_screen.dart';
import 'package:ecommerce_shopping_ui/screens/home_screen.dart';
import 'package:ecommerce_shopping_ui/screens/home_screen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/cart/cart_page.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int PageIndex = 0;

  List<Widget> pages = [
    Home_Screen1(),
    const CartPage(),
    const ProfileScreen(),
    const SettingScreen(),

    // const Scaffold(
    //   body: Center(
    //     child: Text('Home'),
    //   ),
    // ),
    // const Scaffold(
    //   body: Center(
    //     child: Text('Search'),
    //   ),
    // ),
    // const Scaffold(
    //   body: Center(
    //     child: Text('Cart'),
    //   ),
    // ),
    // const Scaffold(
    //   body: Center(
    //     child: Text('Profile'),
    //   ),
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: PageIndex,
          children: pages,
        ),
        floatingActionButton: SafeArea(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.pink,
            child: const Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: const [
            CupertinoIcons.home,
            CupertinoIcons.shopping_cart,
            CupertinoIcons.person,
            CupertinoIcons.settings,
          ],
          inactiveColor: Colors.black.withOpacity(0.5),
          activeColor: Colors.pink,
          activeIndex: PageIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 10,
          rightCornerRadius: 10,
          iconSize: 35,
          elevation: 0,
          onTap: (index) => setState(() => PageIndex = index),
        ));
  }
}
