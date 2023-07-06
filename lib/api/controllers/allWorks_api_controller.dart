import 'dart:convert';
import 'package:worker_app/api/api_settings.dart';
import 'package:worker_app/models/allWorks.dart';
import 'package:http/http.dart' as http;

class AllWorksApiController {
  Future<List<AllWorks>> getAllWorks() async {
    var url = Uri.parse(ApiSettings.ALLWORKS);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray
          .map((jsonObject) => AllWorks.fromJson(jsonObject))
          .toList();
    } else if (response.statusCode == 404) {
//
    } else {
      //
    }
    return [];
  }
}
