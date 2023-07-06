import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:worker_app/api/api_settings.dart';
import 'package:worker_app/models/unComplete_order.dart';
class UnCompleteApiController {

  Future<List<UnCompleteOrder>> getUnCompleteOrder() async {
    var url = Uri.parse(ApiSettings.UNCOMPLETORDER);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray
          .map((jsonObject) => UnCompleteOrder.fromJson(jsonObject))
          .toList();
    } else if (response.statusCode == 404) {
//
    } else {
      //
    }
    return [];
  }

}
