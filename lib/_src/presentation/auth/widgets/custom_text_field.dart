import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final bool isObscure;
  const CustomTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: TextFormField(
        obscureText: isObscure,
        onChanged: onChanged,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(175, 175, 175, 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(155, 155, 155, 1),
                  width: 3,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 3,
                ))),
      ),
    );
  }
}
