import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/register/register_bloc.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/models/register_request_model.dart';
import '../../pages/navigation_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/sign_up.png',
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Email",
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: obscureText,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocConsumer<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              final requestModel = RegisterRequestModel(
                                name: _nameController.text,
                                password: _passwordController.text,
                                email: _emailController.text,
                                username: _nameController.text,
                              );

                              context
                                  .read<RegisterBloc>()
                                  .add(RegisterEvent.register(requestModel));
                            }
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
                            "Create Account",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ));
                    }, listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        error: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Register Error'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        loaded: (model) async {
                          await AuthLocalDatasource().saveAuthData(model);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const NavigationScreen();
                              },
                            ),
                          );
                        },
                      );
                    }),
                  ], // <--- added this
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already Have an Account ?",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ))
                ], // <--- this
              ),
            ],
          ),
        ),
      ),
    );
  }
}
