import 'package:flutter/material.dart';

class CustomTextFormFieldClass extends StatelessWidget {
  const CustomTextFormFieldClass({Key? key,
    required this.label,
    this.onSaved,
    required this.textInputType,
    this.suffix,
    required this.prefix,
    this.suffixPressed,
    this.onSubmit,
    this.onChange,
    required this.controller,
    required this.isPassword,
  })
      : super(key: key);

  final String label;
  final VoidCallback? onSaved;
  final TextInputType textInputType;
  final IconData? suffix;
  final IconData prefix;
  final Function()? suffixPressed;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      validator: ((value) {
        if (value!.isEmpty) {
          return 'This Field is Requierd!';
        }
      }),
      keyboardType: textInputType,
      decoration: InputDecoration(
          labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          disabledBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
      ),
    );
  }
}