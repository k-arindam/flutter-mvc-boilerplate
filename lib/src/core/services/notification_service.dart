import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum NotificationType {
  success("success"),
  warning("warning"),
  error("error");

  const NotificationType(this._value);
  final String _value;

  String get title => _value.toUpperCase();

  Color get color {
    switch (this) {
      case NotificationType.success:
        return Colors.lightGreen;

      case NotificationType.warning:
        return Colors.orange;

      case NotificationType.error:
        return Colors.red.shade900;
    }
  }

  IconData get icon {
    switch (this) {
      case NotificationType.success:
        return Icons.done_all_rounded;

      case NotificationType.warning:
        return Icons.priority_high_rounded;

      case NotificationType.error:
        return Icons.close_rounded;
    }
  }
}

abstract class NotificationService {
  static const _snackStyle = SnackStyle.FLOATING;
  static const _snackPosition = SnackPosition.TOP;
  static const _margin = EdgeInsets.symmetric(horizontal: 8.0);
  static const _duration = Duration(milliseconds: 2700);
  static const _borderRadius = 15.0;
  static const _isDismissible = true;

  static void present(NotificationType type, {required String message}) {
    final snackbar = GetSnackBar(
      // Dynamic data
      icon: Icon(type.icon),
      title: type.title,
      message: message,
      backgroundColor: type.color,

      // Static data
      isDismissible: _isDismissible,
      margin: _margin,
      duration: _duration,
      borderRadius: _borderRadius,
      snackStyle: _snackStyle,
      snackPosition: _snackPosition,
      onTap: (snack) => Get.closeCurrentSnackbar(),
    );

    Get.closeCurrentSnackbar();
    Get.showSnackbar(snackbar);
  }
}
