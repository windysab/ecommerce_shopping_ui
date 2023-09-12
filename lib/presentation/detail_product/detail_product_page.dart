import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_ui/data/models/respons/list_product_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/checkout/checkout_bloc.dart';
import '../../bloc/checkout/checkout_bloc.dart';
import '../cart/cart_page.dart';

class DetailProductPAge extends StatefulWidget {
  const DetailProductPAge({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<DetailProductPAge> createState() => _DetailProductPAgeState();
}

class _DetailProductPAgeState extends State<DetailProductPAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.product.attributes!.name!,
              style: const TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.pink,
              ),
            )
          ]),
      body: ListView(
        children: [
          Card(
            elevation: 2,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.attributes!.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.attributes!.name!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\Rp. ${widget.product.attributes!.price!}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.attributes!.description!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Jumlah Beli ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<CheckoutBloc>().add(
                              RemoveFromCartEvent(
                                product: widget.product,
                              ),
                            );
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, state) {
                        if (state is CheckoutLoaded) {
                          final count = state.items
                              .where(
                                  (element) => element.id == widget.product.id)
                              .length;
                          return Text(
                            '$count',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }
                        return Text(
                          'dfhdkj',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CheckoutBloc>().add(
                              AddToCartEvent(
                                product: widget.product,
                              ),
                            );
                      },
                      icon: const Icon(Icons.add),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                        ),
                        onPressed: () {
                          context.read<CheckoutBloc>().add(
                                AddToCartEvent(
                                  product: widget.product,
                                ),
                              );
                        },
                        child: BlocListener<CheckoutBloc, CheckoutState>(
                          listener: (context, state) {
                            if (state is CheckoutError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Added to cart'),
                                ),
                              );
                            }
                            if (state is CheckoutLoaded) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ),
                              );
                            }
                          },
                          child: BlocBuilder<CheckoutBloc, CheckoutState>(
                            builder: (context, state) {
                              if (state is CheckoutLoading) {
                                return const CircularProgressIndicator();
                              }
                              return Text(
                                'Beli Sekarang',
                                style: const TextStyle(color: Colors.white),
                              );
                            },
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
