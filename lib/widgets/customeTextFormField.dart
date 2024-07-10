import 'package:flutter/material.dart';

Widget custom_text_form(
    bool obsecureText, TextEditingController _controler, String hintText) {
  return TextFormField(
    controller: _controler,
    obscureText: obsecureText,
    decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder()),
  );
}
