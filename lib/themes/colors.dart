import 'package:flutter/material.dart';

/// Define all the colors to be used in application in this file
/// To use - import this file and call required string by:
///```dart
///      AppColors.<name>
///```
///For Color Names refer: http://chir.ag/projects/name-that-color/#6195ED
class AppColors {
  AppColors._();

  // Primary Colors ---------------------------- >
  static const MaterialAccentColor myPrimary = MaterialAccentColor(
    _myPrimary,
    <int, Color>{
      100: Color(0xFF125FA2),
      200: Color(_myPrimary),
      400: Color(0xFF0C4271),
      700: Color(0xFF072642),
    },
  );
  static const int _myPrimary = 0xFF0F538D;

  // static const Color a = Color(0xFF072642);

  // Secondary Colors ---------------------------- >
  static const MaterialAccentColor mySecondary = MaterialAccentColor(
    _mySecondary,
    <int, Color>{
      100: Color(0xFFFAAE3B),
      200: Color(_mySecondary),
      400: Color(0xFFC9851F),
      700: Color(0xFF946218),
    },
  );
  static const int _mySecondary = 0xFFFFA726;

  // static const Color _mySeconda3ry = Color(0xFFFAAE3B);

  // Secondary Colors ---------------------------- >
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF000000);

  static const Color gray = Color(0xFF969696);
  static const Color dividerGray = Color(0xFFE9E9E9);
  static const Color lightGrey = Color(0xFFEEEEEE);
  static const Color hintColor = Color(0xFFB4B4B4);
  static const Color popupButtonColor = Color(0xFFEFEFEF);

  static const Color primary = Color(0xFF0F538D);
  static const Color secondary = Color(0xFFFFA726);
  static const Color whiteText = Color(0xFFF4F4F4);
  static const Color whiteCardColor = Color(0xFFDEDEDE);

  static const Color darkBackground = Color(0xFFF2F2F2);

  static const Color primaryLight = Color(0xFFFFFFFF);
  static const Color primaryDark = Color(0xFF000000);

  static const Color primaryText = Color(0xFF282828);
  static const Color secondaryText = Color(0xFF969696);
  static Color secText = primaryText.withOpacity(0.8);
  static const Color borderColor = Color(0xFFE4E4E4);
  static const Color shadowColor = Color(0x14000000);

  static const Color errorRed = Color(0xFFAF0D0D);
  static const Color red = Color(0xFFC10707);
  static const Color dividerGrey = Color(0xFFD0CCCC);
  static const Color cancelledColor = Color(0xFFE40000);

  // Button Theme --------------------------------------
  static const Color primaryButton = primary;
  static const Color primaryButtonText = darkBackground;
  static const Color primaryButtonDisable = gray;

}
