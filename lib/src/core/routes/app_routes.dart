import 'package:boilerplate/src/views/home_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static const String home = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text(
                "${settings.name} not found !!!",
              ),
            ),
          );
        });
    }
  }
}
