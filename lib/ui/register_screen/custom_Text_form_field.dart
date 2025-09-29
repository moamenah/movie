import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Validator? validator;

  CustomTextFormField({
    Key? key,
    this.hintStyle,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.textPrimary,
      style: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16,
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: AppColors.bgCustomForm,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle ?? AppStyles.regular16White,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.bgCustomForm
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
        errorStyle: AppStyles.regular16White.copyWith(color: AppColors.error),
      ),
      validator: validator,
      controller: controller,
      obscureText: obscureText,

    );
  }
}
