import 'package:boilerplate/src/common/constants/constants.dart';
import 'package:boilerplate/src/core/services/network_service.dart';
import 'package:boilerplate/src/core/services/notification_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with NetworkService {
  final RxnString _data = RxnString();

  Future<void> addUser() async {
    final payload = {
      'name': "Morpheus",
      'job': "Software Engineer",
    };

    final response = await post(
      path: Constants.createUserPath,
      payload: payload,
    );

    _data.value = "$data \n\n$response";

    if (response != null) {
      NotificationService.present(
        NotificationType.success,
        message: "User added successfully !!!",
      );
    }
  }

  // GETTERS
  String? get data => _data.value;

  // SETTERS
}
