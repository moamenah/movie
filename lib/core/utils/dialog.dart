import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class DialogUtils {

  // Loading dialog
  static void showLoading({
    required BuildContext context,
    required String text,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: AppColors.primary),
              const SizedBox(width: 10),
              Text(text, style: AppStyles.regular14White),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  // Message dialog
  static void showMsg({
    required BuildContext context,
    required String text,
    String? title,
    String? postActionName,
    VoidCallback? postAction,  // بدل posAction
    String? navActionName,
    VoidCallback? navAction,
    bool barrierDismissible = true,
  }) {
    List<Widget> actions = [];
    if (postActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            postAction?.call();  // استخدم postAction هنا
          },
          child: Text(postActionName, style: AppStyles.regular14White),
        ),
      );
    }
    if (navActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            navAction?.call();
          },
          child: Text(navActionName, style: AppStyles.regular20black),
        ),
      );
    }

    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => AlertDialog(
        content: Text(text, style: AppStyles.regular14White),
        title: Text(title ?? "", style: AppStyles.regular20black),
        actions: actions,
      ),
    );
  }

}

