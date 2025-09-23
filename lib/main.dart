import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_theme.dart';
import 'package:movie_app/ui/forget_password/forget_password.dart';
import 'package:movie_app/ui/login/login_screen.dart';
import 'package:movie_app/ui/onBoarding/onBoardng_screen.dart';
import 'package:movie_app/ui/register_screen/register_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ← ده اللي ناقص عندك
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.register,
      routes: {
        AppRoutes.onboarding :(context)=>OnboardingScreen(),
        AppRoutes.register :(context)=>RegisterScreen(),
        AppRoutes.login :(context)=>LoginScreen(),
        AppRoutes.forgetpassword :(context)=>ForgetPassword(),
      },
      theme: AppTheme.darkTheme,
    );
  }
}
