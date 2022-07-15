import 'package:dashboard_cageur/styles/consts.dart';
import 'package:flutter/material.dart';

class CustomPassword extends StatelessWidget {
  final String hintexts, validatorText;
  final Icon icons;
  final IconButton sufIcons;
  final bool obscure;
  final TextInputType inputType;
  final TextEditingController controll;
  const CustomPassword(
      {Key? key,
      required this.hintexts,
      required this.icons,
      required this.sufIcons,
      required this.obscure,
      required this.validatorText,
      required this.inputType,
      required this.controll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controll,
        keyboardType: inputType,
        obscureText: obscure,
        decoration: InputDecoration(
            hintText: hintexts,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kgrey, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kgreen, width: 1)),
            prefixIcon: icons,
            suffixIcon: sufIcons),
        validator: (value) {
          if (value!.isEmpty) {
            return validatorText;
          }
        });
  }
}
