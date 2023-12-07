import 'package:get/get.dart';

extension FindOrPut on GetInterface {
  S findOrPut<S>(
    S instance, {
    String? tag,
    bool? permanent,
    S Function()? builder,
  }) {
    if (Get.isRegistered<S>(tag: tag)) {
      return Get.find<S>(tag: tag);
    }

    return Get.put<S>(
      instance,
      tag: tag,
      permanent: permanent ?? false,
      builder: builder,
    );
  }
}
