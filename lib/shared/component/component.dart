import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget formField(
        {required TextEditingController control,
        required bool isScure,
        required String label,
        required Icon prefIcon,
        required FormFieldValidator<String> validator,
        IconButton? suffButton}) =>
    TextFormField(
      validator: validator,
      controller: control,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isScure,
      obscuringCharacter: '*',
      decoration: InputDecoration(
          prefixIcon: prefIcon,
          suffixIcon: suffButton,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );
