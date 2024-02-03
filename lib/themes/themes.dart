import 'package:cryptoapp/themes/colors.dart';
import 'package:flutter/material.dart';

class Themes {
  Themes._();

  static final ThemeData baseTheme = ThemeData.light();

  static ThemeData buildLightTheme() {
    return ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.myPrimary,
          onPrimary: AppColors.whiteText,
          secondary: AppColors.mySecondary,
          onSecondary: AppColors.white,
          error: AppColors.errorRed,
          onError: AppColors.whiteText,
          background: AppColors.white,
          onBackground: AppColors.black,
          surface: AppColors.lightGrey,
          onSurface: AppColors.black,
        ),
        scaffoldBackgroundColor: AppColors.white,
        hintColor: AppColors.secText,
        disabledColor: AppColors.secText,
        shadowColor: AppColors.black.withOpacity(0.15),
        fontFamily: "Poppins",
        appBarTheme: _buildAppBarTheme(),
        textTheme: buildLightTextTheme(),
        buttonTheme: _buildButtonTheme(),
        elevatedButtonTheme: _buildElevatedButtonTheme());
  }

  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: AppColors.myPrimary,
        foregroundColor: AppColors.primaryButtonText,
        disabledBackgroundColor: AppColors.primaryButtonDisable,
        disabledForegroundColor: AppColors.primaryButtonText,
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static AppBarTheme _buildAppBarTheme() {
    return const AppBarTheme(
      elevation: 0,
    );
  }

  static ButtonThemeData _buildButtonTheme() {
    return ButtonThemeData(
      buttonColor: AppColors.primaryButton,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      height: 50,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: AppColors.white,
        secondary: AppColors.primaryDark,
      ),
    );
  }

  static TextTheme buildLightTextTheme() {
    return baseTheme.textTheme
        .copyWith(
          headlineLarge: baseTheme.textTheme.headlineLarge!.copyWith(
            color: AppColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: baseTheme.textTheme.headlineMedium!.copyWith(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: baseTheme.textTheme.headlineSmall!.copyWith(
            color: AppColors.primaryText,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: baseTheme.textTheme.titleSmall!.copyWith(
            color: AppColors.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: baseTheme.textTheme.bodyLarge!.copyWith(
            color: AppColors.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: baseTheme.textTheme.bodyMedium!.copyWith(
            color: AppColors.primaryText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: baseTheme.textTheme.bodySmall!.copyWith(
            color: AppColors.primaryText,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          displayLarge: baseTheme.textTheme.displayLarge!.copyWith(
            color: AppColors.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          displayMedium: baseTheme.textTheme.displayMedium!.copyWith(
            color: AppColors.primaryText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          displaySmall: baseTheme.textTheme.displaySmall!.copyWith(
            color: AppColors.primaryText,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
        .apply(
          fontFamily: 'Poppins',
        );
  }
}
