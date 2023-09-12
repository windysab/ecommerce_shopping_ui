import 'package:flutter/material.dart';

class CustomTextFieldPass extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  final String suffixIcon;

  final int maxLines;

  const CustomTextFieldPass({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.suffixIcon,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  State<CustomTextFieldPass> createState() => _CustomTextFieldPassState();
}

class _CustomTextFieldPassState extends State<CustomTextFieldPass> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        prefixIcon: const Icon(Icons.lock),
        // suffixIcon: IconButton(
        //                 icon: Icon(obscureText
        //                     ? Icons.visibility_off
        //                     : Icons.visibility),
        //                 onPressed: () {
        //                   setState(() {
        //                     obscureText = !obscureText;
        //                   });
        //                 },
        //               ),
        //             ),

        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
      obscureText: obscureText,
    );
    //       enabledBorder: const OutlineInputBorder(
    //           borderSide: BorderSide(
    //             color: Colors.black38,
    //           ),
    //           borderRadius: BorderRadius.all(Radius.circular(20)))),
    //   validator: (val) {
    //     if (val == null || val.isEmpty) {
    //       return 'Enter your ${widget.hintText}';
    //     }
    //     return null;
    //   },
    //   maxLines: widget.maxLines,
    // )
  }
}
