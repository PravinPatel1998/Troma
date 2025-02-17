import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField(
      {super.key, required this.controller, this.isPasswordField = false});

  final TextEditingController controller;
  final bool isPasswordField;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPasswordField,
        onChanged: (value) {},
        validator: (value) {},
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
      ),
    );
  }
}
