// import 'package:ecommerce_shopping_ui/presentation/home/widgets/list_product_widget.dart';
import 'package:flutter/material.dart';

import '../presentation/home/widgets/list_product_widget.dart';

class Home_Screen1 extends StatelessWidget {
  const Home_Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.pink,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              // Container(
              //   height: 150,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.black12.withOpacity(0.05),
              //     boxShadow: const [
              //       BoxShadow(
              //         color: Colors.black12,
              //         blurRadius: 2,
              //         spreadRadius: 1,
              //       )
              //     ],
              //   ),
              // ),
              // const Expanded(child: ListProductWidget())
              // const Expanded(child: ItemsWidget())
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'List Product',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Expanded(child: ListProductWidget())
            ],
          ),
        ),
      ),
    );
  }
}
