import 'package:ecommerce_shopping_ui/common/custom_button.dart';
import 'package:ecommerce_shopping_ui/common/custom_textfield.dart';
import 'package:ecommerce_shopping_ui/presentation/auth/signup_screen.dart';
import 'package:ecommerce_shopping_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_bloc.dart';
import '../../common/custom_textfield_pass.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/models/login_request_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  // final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Login_shopping.png',
                height: 250,
                width: 250,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      // TextFormField(
                      //   controller: _emailController,
                      //   decoration: const InputDecoration(
                      //     hintText: "Enter Email",
                      //     labelText: "Email",
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(20),
                      //       ),
                      //     ),
                      //     prefixIcon: Icon(Icons.email),
                      //   ),
                      // ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Enter Email",
                        labelText: "Email",
                        prefixIcon: "email",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // TextFormField(
                      //   controller: _passwordController,
                      //   decoration: InputDecoration(
                      //     hintText: "Enter Password",
                      //     labelText: "Password",
                      //     border: const OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(20),
                      //       ),
                      //     ),
                      //     prefixIcon: const Icon(Icons.lock),
                      //     suffixIcon: IconButton(
                      //       icon: Icon(obscureText
                      //           ? Icons.visibility_off
                      //           : Icons.visibility),
                      //       onPressed: () {
                      //         setState(() {
                      //           obscureText = !obscureText;
                      //         });
                      //       },
                      //     ),
                      //   ),
                      //   obscureText: obscureText,
                      // ),

                      CustomTextFieldPass(
                        controller: _passwordController,
                        hintText: "Enter Password",
                        labelText: "Password",
                        suffixIcon: "visibility",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) async {
                          if (state is LoginLoaded) {
                            await AuthLocalDatasource()
                                .saveAuthData(state.model);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScreen();
                                },
                              ),
                            );
                          }
                          if (state is LoginError) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Login Gagal'),
                                    content: const Text(
                                        'Login gagal, check data anda'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK',
                                              style: TextStyle(
                                                  color: Colors.black)))
                                    ],
                                  );
                                });
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          // return CustomButton(
                          //     text: "Login",
                          //     onTap: () {
                          //       if (_signInFormKey.currentState!.validate()) {
                          //         final model = LoginRequestModel(
                          //           identifier: _emailController.text,
                          //           password: _passwordController.text,
                          //         );
                          //         context
                          //             .read<LoginBloc>()
                          //             .add(DoLoginEvent(model: model));
                          //       }
                          //     });
                          return ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_signInFormKey.currentState!.validate()) {
                                    final model = LoginRequestModel(
                                      identifier: _emailController.text,
                                      password: _passwordController.text,
                                    );
                                    context
                                        .read<LoginBloc>()
                                        .add(DoLoginEvent(model: model));
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(55),
                                backgroundColor: Colors.pinkAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: Colors.white,
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ));
                        },
                      ),
                    ], // <--- added this
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Divider(
                        color: Colors.black,
                        height: 36,
                      ),
                    ),
                  ),
                  const Text('OR'),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Divider(
                        color: Colors.black,
                        height: 36,
                      ),
                    ),
                  ),
                ], // <--- this
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Tidak Punya Akun?",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignupScreen();
                    }));
                  },
                  icon: const Icon(
                    Icons.app_registration_sharp,
                    size: 16.0,
                  ),
                  label: const Text(
                    'Daftar Sekarang',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
