import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class DialogUtils {


  static void showLoading({
    required BuildContext context,
    required String text,
  }) {showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(color: AppColors.primary),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text, style: AppStyles.regular14White),
            ),
          ],
        ),
      );
    },
  );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMsg({
    required BuildContext context,
    required String text,
    String? title,
    String? postActionName,
    Function? posAction,
    String? navActionName,
    Function? navAction,
    bool barrierDismissible=true,
  }) {
    List<Widget>? actions = [];
    if (postActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
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
