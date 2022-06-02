import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hint,
    required this.prefixIcon,
    this.isObscureText = false,
    this.controller,
    this.sufixIcon, this.validator,
  }) : super(key: key);
  final String? hint;
  final IconData prefixIcon;
  final Widget? sufixIcon;
  final bool isObscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        validator:validator ,
        controller: controller,
        obscureText: isObscureText,
        decoration: InputDecoration(
          hintText: hint ?? "Username",
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black,
          ),
          suffixIcon: sufixIcon,
        ),
      ),
    );
  }
}
