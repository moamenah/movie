import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/login/login_navigator.dart';

class LoginScreenViewModel extends ChangeNotifier {
  // الـ Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late LoginNavigator navigator;

  Future<void> logIn() async {
    if (formKey.currentState!.validate()) {
      navigator.showMyLoading("Loading...");

      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        navigator.hideMyLoading();

        // عرض رسالة النجاح مع إمكانية الضغط للانتقال
        navigator.showMyMsg(
          message: "Login successfully",
          postActionName: "OK",
          postAction: () {
            navigator.navigateToHome(); // لازم تضيف دالة navigateToHome في LoginNavigator
          },
        );

      } on FirebaseAuthException catch (e) {
        navigator.hideMyLoading();
        if (e.code == 'user-not-found') {
          navigator.showMyMsg(message: 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          navigator.showMyMsg(message: 'Wrong password provided.');
        } else if (e.code == 'network-request-failed') {
          navigator.showMyMsg(message: 'Check your internet connection.');
        } else {
          navigator.showMyMsg(message: "Error");
        }
      } catch (e) {
        navigator.hideMyLoading();
        navigator.showMyMsg(message: "Error");
      }
    }
  }
}
