import 'package:boilerplate/src/common/constants/constants.dart';
import 'package:boilerplate/src/core/controllers/auth_controller.dart';
import 'package:boilerplate/src/core/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authController =
      Get.find<AuthController>(tag: Constants.kAuthController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Text(
                  _authController.data.toString(),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => NotificationService.present(
              NotificationType.warning,
              message: "This is a notification test !!!",
            ),
            child: const Icon(
              Icons.notifications_active_rounded,
            ),
          ),
          const SizedBox(width: 12.0),
          FloatingActionButton(
            onPressed: () async => await _authController.addUser(),
            child: const Icon(
              Icons.http_rounded,
            ),
          )
        ],
      ),
    );
  }
}
