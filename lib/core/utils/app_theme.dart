import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.secondaryBackground,
    // error: AppColors.error,

    // ===== TextTheme باستخدام Google Fonts =====
    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        titleLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.textPrimary),
      bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        bodyMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.textPrimary.withOpacity(0.6)),
        //labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
      )
    ),

    // ===== AppBar Theme =====
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primary),
      titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.primary),
    ),



    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.background,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textPrimary,
     type: BottomNavigationBarType.fixed
     // showSelectedLabels: true
    ),



    // ===== BottomNavigationBar Theme =====
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.background,
    //   selectedItemColor: AppColors.primary,
    //   unselectedItemColor: Colors.grey,
    //   showUnselectedLabels: true,
    // ),










    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600,),
      ),
    ),







    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary, // نص الزر
        backgroundColor: Colors.transparent, // خلفية شفافة
        minimumSize: Size(double.infinity, 50),

        side: BorderSide(
        color: AppColors.primary,
        width: 2,
      ),
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(15)
        ),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),

      ),

    ),



    
    // ===== Input Decoration Theme =====
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: AppColors.secondaryBackground,
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: BorderSide.none,
    //   ),
    //   labelStyle: TextStyle(color: AppColors.textSecondary),
    //   hintStyle: TextStyle(color: AppColors.textSecondary.withOpacity(0.7)),
    // ),
  );
}
