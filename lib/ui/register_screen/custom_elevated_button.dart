import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final Color borderColor;
  final Widget? iconWidget; // أيقون اختياري
  final double width;
  final double borderRadius;
  final double borderWidth;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.backgroundColor = AppColors.primary,
    this.borderColor = AppColors.primary,
    this.iconWidget,
    this.width = double.infinity,
    this.borderRadius = 15,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // لو فيه أيقون يظهر، لو مش موجود يبقى SizedBox صفر
            iconWidget != null
                ? Row(
              children: [
                iconWidget!,
                SizedBox(width: 8),
              ],
            )
                : SizedBox.shrink(),
            Text(
              text,
              style: textStyle ?? AppStyles.regular20black,
            ),
          ],
        ),
      ),
    );
  }
}
