import 'package:ecommerce_shopping_ui/data/models/respons/auth_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/listorder/list_order_bloc.dart';
import '../data/datasources/auth_local_datasource.dart';
import '../presentation/auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.a.transfermarkt.technology/portrait/big/85289-1541150488.jpg?lm=1'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user != null ? user!.username : '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user != null ? user!.email : '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '0853xxxxxxxx',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              await AuthLocalDatasource().removeAuthData();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Text('Logout'),
          ),
          const Text(
            'List Order',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: BlocBuilder<ListOrderBloc, ListOrderState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const Center(
                      child: Text('No Orders'),
                    );
                  },
                  loaded: (data) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final order = data.data![index];
                        return Card(
                          elevation: 5,
                          shadowColor: const Color(0xffEE4D2D),
                          child: ListTile(
                            title: Text('Order#${order.id}'),
                            subtitle: Text('${order.attributes!.totalPrice}'),
                          ),
                        );
                      },
                      itemCount: data.data!.length,
                    );
                  },
                );
                // if (state is ListOrderEvent) {
                //   return const CircularProgressIndicator();
                // } else if (state is ListOrderBloc) {
                //   return ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: state.listOrder.length,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         title: Text(state.listOrder[index].name),
                //         subtitle: Text(state.listOrder[index].price.toString()),
                //       );
                //     },
                //   );
                // } else {
                //   return const Text('Error');
                // }
              },
            ),
          )
        ],
      ),
    );
  }
}
