import 'package:ecommerce_shopping_ui/bloc/listorder/list_order_bloc.dart';
import 'package:ecommerce_shopping_ui/presentation/detail_order/detail_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/datasources/auth_local_datasource.dart';
import '../data/models/respons/auth_response_model.dart';

class ProfilAcuant extends StatefulWidget {
  const ProfilAcuant({super.key});

  @override
  State<ProfilAcuant> createState() => _ProfilAcuantState();
}

class _ProfilAcuantState extends State<ProfilAcuant> {
  User? user;

  @override
  void initState() {
    getUser();
    context.read<ListOrderBloc>().add(const ListOrderEvent.get());
    super.initState();
  }

  Future<void> getUser() async {
    user = await AuthLocalDatasource().getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Center(
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          controller: ScrollController(
            keepScrollOffset: true,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://img.a.transfermarkt.technology/portrait/big/85289-1541150488.jpg?lm=1'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user != null ? user!.username : '',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        user != null ? user!.email : '',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'LIST ORDER',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // const Text(
              //   'Email',
              //   style: TextStyle(
              //     fontSize: 15,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(height: 5),
              Column(children: [
                BlocBuilder<ListOrderBloc, ListOrderState>(
                    builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (data) {
                      return Card(
                          elevation: 10,
                          color: Colors.grey[200],
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.data!.length,
                            itemBuilder: (context, index) {
                              final order = data.data![index];
                              return Card(
                                child: ListTile(
                                  title: Text(
                                      '${order.attributes!.items!.first.productName}'),
                                  subtitle: Text(
                                      'Rp. ${order.attributes!.totalPrice}'),
                                  trailing: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 100,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: order.attributes!.statusOrder ==
                                              'pending'
                                          ? Colors.red
                                          : Colors.green,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          '${order.attributes!.statusOrder}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10)),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DetailOrder(
                                            order: order,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ));
                    },
                  );
                })
              ]),
            ],
          )),
    );
  }
}
