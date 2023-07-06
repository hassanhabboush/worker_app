import 'dart:convert';

import 'package:worker_app/api/api_settings.dart';
import 'package:worker_app/models/about_app.dart';
import 'package:http/http.dart' as http;

class AboutAppApiController{
  Future<List<AboutApp>> getAbout() async {
    var url = Uri.parse(ApiSettings.ABOUTAPP);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray
          .map((jsonObject) => AboutApp.fromJson(jsonObject))
          .toList();
    } else if (response.statusCode == 404) {
//
    } else {
      //
    }
    return [];
  }
}