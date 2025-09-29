import 'package:flutter/animation.dart';

abstract class LoginNavigator {
  void showMyLoading(String message);
  void hideMyLoading();
  void showMyMsg({
    required String message,
    String? postActionName,
    VoidCallback? postAction,
    String? navActionName,
    VoidCallback? navAction,
  });

  void navigateToHome();
}
