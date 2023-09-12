import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/checkout/checkout_bloc.dart';
import '../../../bloc/get_products/get_products_bloc.dart';
import '../../../data/models/respons/list_product_response_model.dart';
import 'package:badges/badges.dart' as badges;

class ListProductWidget extends StatefulWidget {
  const ListProductWidget({super.key});

  @override
  State<ListProductWidget> createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  @override
  void initState() {
    context.read<GetProductsBloc>().add(DoGetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsError) {
          return const Center(
            child: Text('data error'),
          );
        }
        if (state is GetProductsLoaded) {
          if (state.data.data!.isEmpty) {
            return const Center(
              child: Text('Data Empty'),
            );
          }
          return GridView.builder(
            itemCount: state.data.data!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final Product product = state.data.data![index];
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(8),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                product.attributes!.image!,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          product.attributes!.name!,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Rp.${product.attributes!.price.toString()}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<CheckoutBloc>().add(
                                      RemoveFromCartEvent(product: product));
                                },
                                child: const Icon(
                                  Icons.remove_circle_outline,
                                  size: 18,
                                  color: Colors.pink,
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child:
                                      BlocBuilder<CheckoutBloc, CheckoutState>(
                                    builder: (context, state) {
                                      if (state is CheckoutLoaded) {
                                        final countItem = state.items
                                            .where((element) =>
                                                element.id == product.id)
                                            .length;
                                        return Text('$countItem');
                                      }
                                      return const Text('0');
                                    },
                                  )),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<CheckoutBloc>()
                                      .add(AddToCartEvent(product: product));
                                },
                                child: const Icon(
                                  Icons.add_circle_outline,
                                  size: 18,
                                  color: Color(0xffEE4D2D),
                                ),
                              ),
                              BlocBuilder<CheckoutBloc, CheckoutState>(
                                builder: (context, state) {
                                  if (state is CheckoutLoaded) {
                                    return badges.Badge(
                                      badgeStyle: const badges.BadgeStyle(
                                          elevation: 0,
                                          badgeColor: Colors.white),
                                      // elevation: 0,
                                      badgeContent: Text(
                                        '${state.items.length}',
                                        style: const TextStyle(
                                            color: Color(0xffEE4D2D)),
                                      ),
                                      // badgeColor: Colors.white,
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(builder: (context) {
                                          //   return const CartPage();
                                          // }));
                                        },
                                        child: const Icon(
                                          Icons.shopping_cart_outlined,
                                          color: Colors.pink,
                                        ),
                                      ),
                                    );
                                  }
                                  return const badges.Badge(
                                    badgeStyle: badges.BadgeStyle(
                                        elevation: 0, badgeColor: Colors.pink),
                                    // elevation: 0,
                                    badgeContent: Text(
                                      '0',
                                      style: TextStyle(color: Colors.pink),
                                    ),
                                    // badgeColor: Colors.white,
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.pink,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
