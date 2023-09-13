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
          title: const Text('Cart'),
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
                  return Card(
                    color: count > 2 ? Colors.pink : Colors.pink[100],
                    child: ListTile(
                      // image: Image.network(
                      //     '${dataSet.elementAt(index).attributes!.image!}'),
                      leading: Card(
                          borderOnForeground: true,
                          elevation: 2,
                          // shadowColor: count > 2 ? Colors.blue : Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.black)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network('${item.attributes!.image}')),
                      title: Text(dataSet.elementAt(index).attributes!.name!),
                      subtitle: Text(
                          'Harga: Rp. ${dataSet.elementAt(index).attributes!.price!}'),
                      trailing: Text('Jumlah: $count'),
                    ),
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
        ));
  }
}
