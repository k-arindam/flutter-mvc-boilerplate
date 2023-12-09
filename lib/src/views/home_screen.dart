import 'package:boilerplate/src/core/services/notification_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => NotificationService.present(
          NotificationType.warning,
          message: "This is a notification test !!!",
        ),
      ),
    );
  }
}
