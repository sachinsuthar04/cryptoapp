import 'package:cryptoapp/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  // show snackbar
  static void pushSnackbar(
    BuildContext context,
    String message, {
    bool error = false,
    int statusCode = 0,
  }) {
    // push a new snackbar with message
    if (message.isNotEmpty) {
      // clear snackbar if any
      ScaffoldMessenger.of(context).clearSnackBars();

      // push a new snackbar with message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: error ? AppColors.errorRed : AppColors.primary,
          duration: const Duration(seconds: 3),
          // duration: Duration(seconds: AuthScreenCubit.delayedSecond),
        ),
      );
    }
  }
}
