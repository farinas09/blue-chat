import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPasword;

  const CustomInput({
    Key key,
    this.icon,
    @required this.hint,
    @required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPasword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        padding: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: TextField(
          autocorrect: false,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPasword,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: hint,
          ),
        ));
  }
}
