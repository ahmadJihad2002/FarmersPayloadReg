import 'package:flutter/material.dart';

Widget inputField({
  required validate,
  required TextInputType type,
  required Widget label,
  required String hintText,
  required icon,
  required TextEditingController controller,
  onChange,
  onSubmit,
}) {
  return TextFormField(

    controller: controller,
    onChanged: onChange,
    onFieldSubmitted: onSubmit,
    keyboardType: type,
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(),
      label: label,
    ),
    validator: validate,
  );
}
