import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://studentucas.awamr.com/api'; // استبدله برابط الـ API الخاص بك

  Future<dynamic> postData(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create/order'), // استبدله برابط نهاية الـ API الخاص بك
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post data: ${response.statusCode}');
    }
  }
}
