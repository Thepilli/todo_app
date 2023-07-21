import 'package:flutter/material.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';

class CoreUtils {
  const CoreUtils._();

  static void showSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showLoader(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            if (message != null)
              Text(
                '$message...',
                style: appstyle(12, AppColors.tPrimaryColor, FontWeight.bold),
              )
          ],
        ),
      ),
    );
  }
}
