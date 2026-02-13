import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  ApiException(this.message, {this.statusCode});

  @override
  String toString() => message; // مهم: يطبع الرسالة فقط
}

class ApiService {
  static const String baseUrl = 'http://192.168.8.73:4000';

  static Future<dynamic> get(String endpoint) async {
    final uri = Uri.parse('$baseUrl/$endpoint');

    // endpoint = categories
    try {
      final response = await http.get(uri, headers: {
        'Accept': 'application/json',
      });

      final bodyText = utf8.decode(response.bodyBytes);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(bodyText);
      }

      String msg = 'HTTP ${response.statusCode}';
      try {
        final decoded = json.decode(bodyText);
        if (decoded is Map && decoded['message'] != null) {
          msg = decoded['message'].toString();
        }
      } catch (_) {
      }

      throw ApiException(msg, statusCode: response.statusCode);
    } on http.ClientException {
      throw ApiException('تعذر الاتصال بالسيرفر');
    } on FormatException {
      throw ApiException('صيغة الاستجابة غير صحيحة');
    }
  }

  static Future<dynamic> post(String endpoint, dynamic data) async {
    final uri = Uri.parse('$baseUrl/$endpoint');

    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(data),
      );

      final bodyText = utf8.decode(response.bodyBytes);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(bodyText);
      }

      String msg = 'HTTP ${response.statusCode}';
      try {
        final decoded = json.decode(bodyText);
        if (decoded is Map && decoded['message'] != null) {
          msg = decoded['message'].toString();
        }
      } catch (_) {}

      throw ApiException(msg, statusCode: response.statusCode);
    } on http.ClientException {
      throw ApiException('تعذر الاتصال بالسيرفر');
    } on FormatException {
      throw ApiException('صيغة الاستجابة غير صحيحة');
    }
  }
}
