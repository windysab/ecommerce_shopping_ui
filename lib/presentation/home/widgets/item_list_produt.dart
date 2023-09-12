import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.68,
      shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black12.withOpacity(0.05),
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.black12,
            //     blurRadius: 2,
            //     spreadRadius: 1,
            //   )
            // ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12,
                    ),
                    child: const Text(
                      'New',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.pink,
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/images/image6.jpg',
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'T-Shirt',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Rp. 150.000',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),
              const Divider(
                height: 2,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
