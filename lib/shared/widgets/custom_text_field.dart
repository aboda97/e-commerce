import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.onChanged, this.hintText, this.label, this.obscureText});

  Function(String)? onChanged;
  String? hintText;
  String? label;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data){
        if(data!.isEmpty){
          return 'this field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text('$label'),
        labelStyle: TextStyle(
            color: Colors.white
        ),
        hintStyle: TextStyle(
          color: Colors.white
        ),
        border: OutlineInputBorder(
          // border دي الحاله الجينرال للبوردر
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          // enabledBorder دي علشان اللون يظهرلي لما بعطي لون للفورم
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
