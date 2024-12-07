import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final bool? obscureText;
  final Function (String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
      super.key, 
      this.label, 
      this.hintText, 
      this.errorText, 
      this.onChanged, 
      this.validator, 
      this.obscureText
    });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(10));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(color: colors.secondary),
          ),
          errorBorder: border.copyWith(
            borderSide: BorderSide(color: colors.error),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(color: colors.error),
          ),
          isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hintText,
          // prefixIcon:  Icon(Icons.person , color : colors.primary),
          // suffixIcon: Icon(Icons.check_circle, color: colors.secondary),
          errorText: errorText),
    );
  }
}
