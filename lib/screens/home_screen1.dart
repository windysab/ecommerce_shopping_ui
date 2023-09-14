// import 'package:ecommerce_shopping_ui/presentation/home/widgets/list_product_widget.dart';
import 'package:flutter/material.dart';

import '../presentation/home/widgets/banner_widget.dart';
import '../presentation/home/widgets/list_category_widget.dart';
import '../presentation/home/widgets/list_product_widget.dart';

class Home_Screen1 extends StatelessWidget {
  const Home_Screen1({super.key});

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
          Expanded(child: ListProductWidget())
        ],
      ),

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
