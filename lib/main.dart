import 'package:ecommerce_shopping_ui/data/datasources/auth_remote_datasource.dart';
import 'package:ecommerce_shopping_ui/data/datasources/product_remote_datasource.dart';
import 'package:ecommerce_shopping_ui/pages/navigation_screen.dart';
import 'package:ecommerce_shopping_ui/presentation/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/checkout/checkout_bloc.dart';
import 'bloc/get_products/get_products_bloc.dart';
import 'bloc/login/login_bloc.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetProductsBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECommerce Sopping App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
