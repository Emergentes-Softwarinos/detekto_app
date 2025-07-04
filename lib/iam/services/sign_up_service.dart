import 'dart:convert';

import 'package:http/http.dart' as http;

class SignUpService {
  final String baseUrl = 'http://10.0.2.2:8080/api/v1';

  Future<String?> signUp(
    String fullName,
    String email,
    String password,
    List<String> roles,
  ) async {
    final url = Uri.parse("$baseUrl/auth/sign-up");

    final body = {
      "fullName": fullName,
      "email": email,
      "password": password,
      "roles": roles,
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        return null; // éxito
      } else {
        final responseBody = jsonDecode(response.body);
        return responseBody['message'] ?? "Error desconocido del servidor";
      }
    } catch (e) {
      return "No se pudo conectar con el servidor. Inténtalo más tarde.";
    }
  }
}
