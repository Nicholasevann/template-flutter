import 'package:boneconsulting/core/index.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastUtil {
  static showErrorToast(
    BuildContext context, {
    required String? msg,
    int durationInSecond = 3,
  }) {
    return toastification.showCustom(
      context: context,
      autoCloseDuration: Duration(seconds: durationInSecond),
      animationDuration: const Duration(milliseconds: 200),
      builder: (context, close) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.error, color: Colors.red),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                msg ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12, // Adjust this value for text size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static showSuccessToast(
    BuildContext context, {
    required String? msg,
    int durationInSecond = 3,
  }) {
    return toastification.showCustom(
      context: context,
      autoCloseDuration: Duration(seconds: durationInSecond),
      animationDuration: const Duration(milliseconds: 200),
      builder: (context, close) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                msg ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
