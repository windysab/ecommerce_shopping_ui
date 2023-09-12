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
                  return ListTile(
                    // image: Image.network(
                    //     '${dataSet.elementAt(index).attributes!.image!}'),
                    title:
                        Text('${dataSet.elementAt(index).attributes!.name!}'),
                    subtitle: Text(
                        'Price: \$${dataSet.elementAt(index).attributes!.price!}'),
                    trailing: Text('Qty: $count'),
                  );
                },
              );
            }
            return ListView(children: const [
              ListTile(
                title: Text('Product 1'),
                subtitle: Text('Price: \$100'),
                trailing: Text('Qty: 1'),
              ),
            ]);
          },
        ));
  }
}
