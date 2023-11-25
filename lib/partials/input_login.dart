import 'package:flutter/material.dart';

class InputLogin extends StatefulWidget {
  final bool? isValid;
  final bool? obscure;
  final InputDecoration decoration;
  final TextEditingController controller;
  const InputLogin({
    super.key,
    required this.controller,
    required this.decoration,
    this.obscure,
    this.isValid,
  });

  @override
  State<InputLogin> createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  bool isValid = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
      child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              setState(() {
                isValid = false;
              });
              return null;
            }
            return null;
          },
          controller: widget.controller,
          decoration: widget.decoration,
          obscureText: widget.obscure ?? false),
    );
  }
}
