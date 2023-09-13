import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/checkout/checkout_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Cart'),
        actions: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoaded) {
                final total = state.items
                    .fold(0, (sum, item) => sum + item.attributes!.price!);
                final uniquiItem = state.items.toSet().length;
                final dataSet = state.items.toSet();
                return Row(
                  children: [
                    Text(
                      'Total: Rp. $total',
                      style: const TextStyle(color: Colors.black),
                    ),
                    if (uniquiItem > 2)
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.white,
                        ),
                        child: const Text('Checkout',
                            style: TextStyle(color: Colors.white)),
                      ),
                  ],
                );
              }
              return Container(); // Return an empty container if not loaded
            },
          ),
        ],
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoaded) {
            final uniquiItem = state.items.toSet().length;
            final dataSet = state.items.toSet();
            return ListView.builder(
              itemCount: uniquiItem,
              itemBuilder: (context, index) {
                final item = dataSet.elementAt(index);
                final count =
                    state.items.where((element) => element == item).length;
                return Column(
                  children: [
                    Card(
                      color: count > 2 ? Colors.pink : Colors.pink[100],
                      child: ListTile(
                        leading: Card(
                          borderOnForeground: true,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.black),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network('${item.attributes!.image}'),
                        ),
                        title: Text(dataSet.elementAt(index).attributes!.name!),
                        subtitle: Text('Harga: Rp. ${item.attributes!.price!}'),
                        trailing: Text('Jumlah: $count'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Hapus Item'),
                                content: const Text(
                                    'Apakah anda yakin ingin menghapus item ini?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Tidak'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.read<CheckoutBloc>().add(
                                          DeleteFromCartEvent(product: item));
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Ya'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    if (count > 1)
                    
                      Column(
                        children: [
                          Text('Total: Rp. ${item.attributes!.price! * count}'),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CheckoutBloc>()
                                  .add(DeleteFromCartEvent(product: item));
                            },
                            child: const Text('Hapus'),
                          ),
                        ],
                      ),
                  ],
                );
              },
            );
          }

          return ListView(children: const [
            ListTile(
              title: Text('Product 0'),
              subtitle: Text('Price: \$0'),
              trailing: Text('Qty: 0'),
            ),
          ]);
        },
      ),
    );
  }
}
