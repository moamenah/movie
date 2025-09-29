import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/home/home_tab.dart';
import 'package:movie_app/ui/onBoarding/onBoardng_screen.dart';
import 'package:movie_app/view_model/action_movie_view_model.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'view_model/movies_view_model.dart';
import 'ui/forget_password/forget_password.dart';
import 'ui/home/home_screen.dart';
import 'ui/login/login_screen.dart';
import 'ui/register_screen/register_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // مهم قبل أي await
  await Firebase.initializeApp();             // تهيئة Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MoviesViewModel>(create: (_) => MoviesViewModel()..fetchMovies()),
        ChangeNotifierProvider<MoviesViewModel>(create: (_) => MoviesViewModel()..fetchMovies(genre: "Comedy")),
        // هنا ممكن تضيف أي ViewModel ثاني في المستقبل
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home_screen, // صححت typo من hoome → home
        routes: {
          AppRoutes.onboarding: (context) =>  OnboardingScreen(),
          AppRoutes.register: (context) =>  RegisterScreen(),
          AppRoutes.login: (context) =>  LoginScreen(),
          AppRoutes.home_screen: (context) =>  HomeScreen(),
          AppRoutes.home_tab: (context) =>  HomeTab(),
          AppRoutes.forgetpassword: (context) =>  ForgetPassword(),
        },
        theme: AppTheme.darkTheme,
      ),
    );
  }
}
