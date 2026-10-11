import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Coffee Rock Typographic Hierarchy
class AppTypography {
  AppTypography._();

  static TextStyle get headlineLarge => headlineLg;
  static TextStyle get headlineMedium => headlineMd;
  static TextStyle get headlineSmall => headlineSm;
  static TextStyle get bodyLarge => bodyLg;
  static TextStyle get bodyMedium => bodyMd;
  static TextStyle get bodySmall => bodySm;
  static TextStyle get labelLarge => labelLg;
  static TextStyle get labelMedium => labelMd;
  static TextStyle get labelSmall => labelSm;

  static TextStyle displayLg = GoogleFonts.epilogue(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 48 / 40,
    letterSpacing: -0.02 * 40,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineLg = GoogleFonts.epilogue(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 36 / 28,
    letterSpacing: -0.01 * 28,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineMd = GoogleFonts.epilogue(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 30 / 22,
    letterSpacing: -0.01 * 22,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineSm = GoogleFonts.epilogue(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    color: AppColors.textPrimary,
  );

  static TextStyle numericCurrency = GoogleFonts.epilogue(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 24 / 20,
    color: AppColors.espressoBrown,
  );

  static TextStyle bodyLg = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMd = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    color: AppColors.textPrimary,
  );

  static TextStyle bodySm = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    color: AppColors.textSecondary,
  );

  static TextStyle labelLg = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 18 / 14,
    letterSpacing: 0.02 * 14,
    color: AppColors.textPrimary,
  );

  static TextStyle labelMd = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.03 * 12,
    color: AppColors.textPrimary,
  );

  static TextStyle labelSm = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 14 / 10,
    letterSpacing: 0.05 * 10,
    color: AppColors.textSecondary,
  );
}
