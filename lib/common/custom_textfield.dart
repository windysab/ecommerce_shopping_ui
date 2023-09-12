import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String prefixIcon;
  final int maxLines;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          prefixIcon: prefixIcon.isNotEmpty ? const Icon(Icons.email) : null,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
