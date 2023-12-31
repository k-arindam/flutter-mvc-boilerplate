import 'package:boilerplate/src/core/routes/app_routes.dart';
import 'package:boilerplate/src/core/utils/app_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  final orientations = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];

  SystemChrome.setPreferredOrientations(orientations)
      .then((_) => runApp(const BoilerplateApp()));
}

class BoilerplateApp extends StatefulWidget {
  const BoilerplateApp({super.key});

  @override
  State<BoilerplateApp> createState() => _BoilerplateAppState();

  static void restartApp(BuildContext context) =>
      context.findAncestorStateOfType<_BoilerplateAppState>()?.restart();
}

class _BoilerplateAppState extends State<BoilerplateApp> {
  Key _sessionKey = UniqueKey();

  void restart() {
    setState(() {
      _sessionKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _sessionKey,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AppBindings(),
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
