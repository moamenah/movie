import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/firebase/firebase_fire_store.dart';
import 'package:movie_app/core/firebase/user_model_store.dart';
import 'package:movie_app/ui/register_screen/register_navigator.dart';

class RegisterViewModel extends ChangeNotifier {
  // Controllers for form fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  // Form key
  final formKey = GlobalKey<FormState>();

  // Navigator to show messages/loading
  late RegisterNavigator navigator;

  // Register method
  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      navigator.showMyLoading("Loading...");

      try {
        // 1️⃣ Create user in FirebaseAuth
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // 2️⃣ Prepare UserModel for Firestore
        UserModel userModel = UserModel(
          id: credential.user!.uid,
          name: nameController.text.trim(),
          phone: phoneController.text.trim(),
        );

        // 3️⃣ Add user to Firestore
        await FireBaseFireStore.addUser(userModel);

        navigator.hideMyLoading();
        navigator.showMyMsg("Register successfully");
        print("User added to Firestore with id ${userModel.id}");
      } on FirebaseAuthException catch (e) {
        navigator.hideMyLoading();

        if (e.code == 'weak-password') {
          navigator.showMyMsg("The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          navigator.showMyMsg("The account already exists for that email.");
        } else if (e.code == 'network-request-failed') {
          navigator.showMyMsg(
              "Network error. Please check your internet connection.");
        } else {
          navigator.showMyMsg("Firebase error: ${e.message}");
        }
      } catch (e) {
        navigator.hideMyLoading();
        navigator.showMyMsg("Unexpected error: $e");
      }

    }
  }
}
