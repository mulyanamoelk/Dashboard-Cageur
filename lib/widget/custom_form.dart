import 'package:dashboard_cageur/styles/consts.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final String hintext, TextValue;
  final Icon icon;
  final bool obscureText;
  final TextInputType KeyboardType;
  final TextEditingController controll;

  const CustomForm({
    Key? key,
    required this.hintext,
    required this.TextValue,
    required this.icon,
    this.obscureText = false,
    required this.KeyboardType,
    required this.controll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controll,
        keyboardType: KeyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kgrey, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kgreen, width: 1)),
            hintText: hintext,
            prefixIcon: icon,
            iconColor: kgreen),
        validator: (value) {
          if (value!.isEmpty) {
            return TextValue;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
