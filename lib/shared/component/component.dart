import 'package:abu_zaid/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget formField(
        {required TextEditingController control,
        required bool isScure,
        required String label,
        required Icon prefIcon,
        ValueChanged<String>? onSubmit,
        required FormFieldValidator<String> validator,
        IconButton? suffButton}) =>
    TextFormField(
      validator: validator,
      controller: control,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isScure,
      obscuringCharacter: '*',
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
          prefixIcon: prefIcon,
          suffixIcon: suffButton,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );

Widget itemBuilder(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage('${model.image}')),
        SizedBox(
          height: 30,
        ),
        Text(
          '${model.title}',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${model.body}',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
