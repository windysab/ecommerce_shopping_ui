import 'package:flutter/material.dart';

class CustomTextFieldPassPercb extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String suffixIcon;

  CustomTextFieldPassPercb({
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.suffixIcon,
  });

  @override
  _CustomTextFieldPassPercbState createState() =>
      _CustomTextFieldPassPercbState();
}

class _CustomTextFieldPassPercbState extends State<CustomTextFieldPassPercb> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
