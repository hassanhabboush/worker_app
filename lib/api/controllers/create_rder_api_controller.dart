import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:worker_app/api/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:worker_app/models/base_response.dart';
import 'package:worker_app/models/create%20_order.dart';
import 'package:worker_app/prefs/user_preferences_controller.dart';
import 'package:worker_app/utils/helpers.dart';

class CreateOrderApiController with Helpers{
  Future<bool> addOrder({
    required BuildContext context,
    required String work_id,
    required String details,
    required String detailsAddress,
    required String long,
    required String lat,
    required String phone,
    required String photo,
  }) async {
    var url = Uri.parse(ApiSettings.CREATEORDER);
    var response = await http.post(url, body: {
      'work_id': work_id,
      'details': details,
      'details_address': detailsAddress,
      'phone': long,
      'lat': lat,
      'long': phone,
      'photos': photo,
    });

    if (response.statusCode == 200) {

      // var jsonResponse = jsonDecode(response.body);
      // CreateOrder createOrder = CreateOrder.fromJson(jsonResponse['data']);
      // await UserPreferencesController().saveOrder(createOrder: createOrder);

      BaseResponse<CreateOrder> baseResponse = BaseResponse.fromJson(jsonDecode(
          response.body));
      print("baseResponse : ${baseResponse.message}");
      return true;
    } else if (response.statusCode == 400) {
     showSnakeBar(context: context, message: jsonDecode(response.body)['message'],error: true);
    }
    return false;
  }

  Future<bool> addOrderCard({
    required BuildContext context,
    required String work_id,
    required String details,
    required String detailsAddress,
    required String phone,
    required String photo,
  }) async {
    var url = Uri.parse(ApiSettings.CREATEORDER);
    var response = await http.post(url, body: {
      'work_id': work_id,
      'details': details,
      'details_address': detailsAddress,
      'long': phone,
      'photos': photo,
    });

    if (response.statusCode == 200) {
      // BaseResponse<CreateOrder> baseResponse =
      // BaseResponse.fromJson(jsonDecode(response.body));
      var jsonResponse = jsonDecode(response.body);
      CreateOrder createOrder = CreateOrder.fromJson(jsonResponse['data']);
      await UserPreferencesController().saveOrder(createOrder: createOrder);
      print(response.body);
      return true;
    } else if (response.statusCode == 400) {
      showSnakeBar(context: context, message: jsonDecode(response.body)['message'],error: true);
    }
    return false;
  }




}
