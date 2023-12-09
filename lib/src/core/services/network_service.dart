import 'dart:convert';
import 'dart:io';

import 'package:boilerplate/src/common/constants/constants.dart';
import 'package:boilerplate/src/core/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

mixin NetworkService {
  final Map<String, String> _serviceHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  @protected
  Future<Map?> post({
    required String path,
    Map? payload,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.https(Constants.baseUrl, path);

    headers?.addAll(_serviceHeaders);

    http.Response resp;

    try {
      resp = await http.post(
        uri,
        body: jsonEncode(payload),
        headers: headers ?? _serviceHeaders,
      );

      if (resp.statusCode == 201) {
        return jsonDecode(resp.body) as Map;
      }

      NotificationService.present(
        NotificationType.error,
        message: "Status Code Got --->>> ${resp.statusCode}",
      );
    } catch (e) {
      debugPrint("POST error --->>> $e");
      NotificationService.present(
        NotificationType.error,
        message: "Error --->>> $e",
      );
    }

    return null;
  }
}
