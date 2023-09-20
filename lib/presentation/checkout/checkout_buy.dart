import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/checkout/checkout_bloc.dart';
import '../../bloc/order/order_bloc.dart';
import '../../common/snap_widget.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/models/order_request_model.dart';

class CheckoutBuy extends StatefulWidget {
  const CheckoutBuy({super.key});

  @override
  State<CheckoutBuy> createState() => _CheckoutBuyState();
}

class _CheckoutBuyState extends State<CheckoutBuy> {
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout Page')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Alamat Pengiriman'),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: addressController,
              maxLines: 4,
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(
                labelText: '',
                border: OutlineInputBorder(),
                hintText: 'Alamat Pengiriman',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: BlocListener<OrderBloc, OrderState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    loaded: (model) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SnapWidget(url: model.redirectUrl);
                      }));
                    },
                  );
                },
                child: BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    if (state is CheckoutLoaded) {
                      final uniqueItem = state.items.toSet().length;
                      final dataSet = state.items.toSet();
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final count = state.items
                              .where(
                                (element) =>
                                    element.id == dataSet.elementAt(index).id,
                              )
                              .length;
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  dataSet.elementAt(index).attributes!.image!,
                                ),
                              ),
                              title: Text(
                                  dataSet.elementAt(index).attributes!.name!,
                                  style: const TextStyle(fontSize: 12)),
                              subtitle: Text(
                                'Rp ${dataSet.elementAt(index).attributes!.price!} x $count',
                              ),
                              trailing: Text(
                                'Total : ${dataSet.elementAt(index).attributes!.price! * count}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: uniqueItem,
                      );
                    }
                    // return ListView.builder(
                    //   itemBuilder: (context, index) {
                    //     return ListTile(
                    //       leading: CircleAvatar(
                    //         backgroundImage: NetworkImage(
                    //           state.items[index].product.image,
                    //         ),
                    //       ),
                    //       title: Text(state.items[index].product.name),
                    //       subtitle: Text(
                    //         '${state.items[index].quantity} item(s) '
                    //         '• ${state.items[index].totalPrice}',
                    //       ),
                    //     );
                    //   },
                    //   itemCount: state.items.length,
                    // );
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // Text(
            //   ' Total: Rp. ${state.items.fold(0, (sum, item) => sum + item.attributes!.price!)}',
            //   style: const TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 16,
            //   ),
            // ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state is CheckoutLoaded) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                      ),
                      onPressed: () async {
                        final userId = await AuthLocalDatasource().getUserId();
                        final total = state.items.fold(
                            0, (sum, item) => sum + item.attributes!.price!);
                        final data = Data(
                          items: state.items
                              .map((e) => Item(
                                  id: e.id!,
                                  productName: e.attributes!.name!,
                                  price: e.attributes!.price!,
                                  qty: 1))
                              .toList(),
                          totalPrice: total,
                          deliveryAddress: addressController.text,
                          courierName: 'JNE',
                          shippingCost: 22000,
                          statusOrder: 'waitingPayment',
                          userId: userId,
                        );
                        final requestModel = OrderRequestModel(data: data);
                        context
                            .read<OrderBloc>()
                            .add(OrderEvent.doOrder(requestModel));
                      },
                      child: const Text(
                        'Buat Pesanan',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
