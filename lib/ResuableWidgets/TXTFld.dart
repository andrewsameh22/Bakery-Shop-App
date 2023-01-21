import 'package:flutter/material.dart';

import '../styles/colours.dart';

Widget TxtFld({
  required TextEditingController controller,
  TextInputType? keyType,
  required String label,
  Icon? picon,
  onTap,
  //required onChanged,
  TextStyle? labelStyle,
  validator,
  IconButton? sicon,
  bool isPassword = false,
  bool? readOnly,
  ValueChanged<String>? onSubmit,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyType,
      validator: validator,
      onTap: onTap,
      readOnly: readOnly ?? false,

      //onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: primaryColor,
      decoration: InputDecoration(
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // labelText: label,
        // //label: label,
        // labelStyle: TextStyle(
        //   fontSize: 16.0,
        //   color: primaryColor,
        // ),

        hintText: label,
        focusColor: primaryColor,
        hoverColor: primaryColor,
        prefixIcon: picon,
        suffixIcon: sicon != null ? sicon : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
      ),
    );
