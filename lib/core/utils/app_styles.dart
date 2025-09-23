import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class AppStyles{
  static TextStyle regular16White =GoogleFonts.inter(
      fontWeight: FontWeight.w400,
          fontSize: 16,
    color: AppColors.textPrimary
      );

  //**************
  static TextStyle regular20black =GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: AppColors.background
  );

  static TextStyle regular14White =GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.textPrimary
  );


}