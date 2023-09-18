// import 'package:ecommerce_shopping_ui/presentation/home/widgets/list_product_widget.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

import '../bloc/checkout/checkout_bloc.dart';
import '../common/global_variables.dart';
import '../pages/navigation_screen.dart';
import '../pages/profil_screen.dart';
import '../pages/setting_screen.dart';
import '../presentation/cart/cart_page.dart';
import '../presentation/home/widgets/banner_widget.dart';
import '../presentation/home/widgets/list_category_widget.dart';
import '../presentation/home/widgets/list_product_widget.dart';

class Home_Screen1 extends StatefulWidget {
  const Home_Screen1({super.key});

  @override
  State<Home_Screen1> createState() => _Home_Screen1State();
}

class _Home_Screen1State extends State<Home_Screen1> {
  // final int _page = 0;
  // double bottomBarWidth = 42;
  // double bottomBarBorderWidth = 5;
  // int PageIndex = 0;
  final int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // List<Widget> pages = [
  //   const Home_Screen1(),
  //   const CartPage(),
  //   const ProfileScreen(),
  //   const SettingScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.shopping_cart,
        //       color: Colors.pink,
        //     ),
        //   ),
        // ],
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          // lanjutkan kode nya

          title: Row(
            children: [
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12.withOpacity(0.05),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.pink),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ),

              // const Text(
              //   'E-Commerce',
              //   style: TextStyle(
              //     color: Colors.pink,
              //     fontSize: 20,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              const SizedBox(
                width: 16,
              ),
              const Icon(
                Icons.notifications,
                color: Colors.pink,
              )
            ],
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          ListCategoryWidget(),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BannerWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'List Product',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(child: ListProductWidget()),
          // ElevatedButton(
          //   onPressed: () {
          //     final CurvedNavigationBarState? navBarState =
          //         _bottomNavigationKey.currentState;
          //     navBarState?.setPage(1);
          //   },
          //   child: const Text('Go to Navigation Screen'),
          // ),
          // NavigationScreen(),
        ],
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   // index: pages.indexOf(pages.first),
      //   key: _bottomNavigationKey,
      //   backgroundColor: Colors.white,
      //   color: Colors.pink,
      //   buttonBackgroundColor: Colors.pink,
      //   height: 70,
      //   items: const <Widget>[
      //     Icon(
      //       Icons.home,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //     Icon(Icons.shopping_cart, size: 30, color: Colors.white),
      //     Icon(Icons.person, size: 30, color: Colors.white),
      //     Icon(Icons.settings, size: 30, color: Colors.white),
      //   ],
      //   animationDuration: const Duration(milliseconds: 200),
      //   animationCurve: Curves.bounceInOut,
      //   onTap: (index) {
      //     print('index ke $index');
      //     setState(() {
      //       _page = index;
      //     });
      //   },
      // ),

      // floatingActionButton: SafeArea(
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     backgroundColor: Colors.pink,
      //     child: const Icon(
      //       Icons.qr_code_scanner,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   icons: const [
      //     CupertinoIcons.home,
      //     CupertinoIcons.shopping_cart,
      //     CupertinoIcons.person,
      //     CupertinoIcons.settings,
      //   ],
      //   inactiveColor: Colors.black.withOpacity(0.5),
      //   activeColor: Colors.pink,
      //   activeIndex: PageIndex,
      //   gapLocation: GapLocation.center,
      //   notchSmoothness: NotchSmoothness.softEdge,
      //   leftCornerRadius: 10,
      //   rightCornerRadius: 10,
      //   iconSize: 35,
      //   elevation: 0,
      //   onTap: (index) => setState(() => PageIndex = index),
      // )

      // body: SafeArea(
      //   child: Padding(
      //     padding: EdgeInsets.all(16),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,st [
      //                   BoxShadow(
      //                     color: Colors.black12,
      //                     blurRadius: 2,
      //                     spreadRadius: 1,
      //                   )
      //                 ],
      //               ),
      //               child: TextForm
      //           children: [
      //             Container(
      //               padding: const EdgeInsets.all(5),
      //               height: 50,
      //               width: MediaQuery.of(context).size.width * 0.8,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(10),
      //                 color: Colors.black12.withOpacity(0.05),
      //                 boxShadow: conField(
      //                 decoration: const InputDecoration(
      //                   border: InputBorder.none,
      //                   prefixIcon: Icon(Icons.search, color: Colors.pink),
      //                   hintText: 'Search',
      //                   hintStyle: TextStyle(
      //                     color: Colors.pink,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             const Icon(
      //               Icons.shopping_cart,
      //               color: Colors.pink,
      //             ),
      //           ],
      //         ),
      //         const SizedBox(
      //           height: 16,
      //         ),
      //         // Container(
      //         //   height: 150,
      //         //   width: MediaQuery.of(context).size.width,
      //         //   decoration: BoxDecoration(
      //         //     borderRadius: BorderRadius.circular(10),
      //         //     color: Colors.black12.withOpacity(0.05),
      //         //     boxShadow: const [
      //         //       BoxShadow(
      //         //         color: Colors.black12,
      //         //         blurRadius: 2,
      //         //         spreadRadius: 1,
      //         //       )
      //         //     ],
      //         //   ),
      //         // ),
      //         // const Expanded(child: ListProductWidget())
      //         // const Expanded(child: ItemsWidget())
      //         const SizedBox(
      //           height: 16,
      //         ),
      //         const ListCategoryWidget(),
      //         const SizedBox(
      //           height: 8,
      //         ),
      //         const Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 16),
      //           child: BannerWidget(),
      //         ),
      //         const Padding(
      //           padding: EdgeInsets.only(left: 16),
      //           child: Text(
      //             'List Product',
      //             style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.w500,
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 8,
      //         ),
      //         const Expanded(child: ListProductWidget())
      //       ],
      //     ),
      //   ),
    );
  }
}
