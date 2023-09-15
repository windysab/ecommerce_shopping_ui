import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Checkout Page')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
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
                  border: OutlineInputBorder(),
                  hintText: 'Alamat Pengiriman',
                ),
              ),
              const SizedBox(
              height: 8,
            ),
            //lanjutkan tampilan checkoutnya ?

            
            ],
          ),
        ));
  }
}
