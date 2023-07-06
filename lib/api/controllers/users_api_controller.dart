import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:worker_app/api/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:worker_app/models/base_response.dart';
import 'package:worker_app/models/user.dart';
import 'package:worker_app/prefs/user_preferences_controller.dart';
import 'package:worker_app/utils/helpers.dart';

class UsersApiController with Helpers{
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse(ApiSettings.LOGIN);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      User user = User.fromJson(jsonResponse['data']);
      UserPreferencesController().saveUser(user: user);
      // print("fullName: ${PrefKeys.name}");

      return true;
//
    } else if (response.statusCode == 400) {
//
    } else {
      //
    }
    return false;
  }

  Future<bool> logOut() async {
    var url = Uri.parse(ApiSettings.LOGOUT);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: UserPreferencesController().token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      await UserPreferencesController().clear();
      return true;
    } else {
      //
    }
    return false;
  }

  Future<bool> register({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    var url = Uri.parse(ApiSettings.REGISTER);
    var response = await http.post(url, body: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    });

    if (response.statusCode == 200) {
      BaseResponse<User> baseResponse = BaseResponse.fromJson(jsonDecode(
          response.body));
      print("baseResponse : ${baseResponse.message}");
      print("fullName: ${PrefKeys.name}");
      return true;
    } else if (response.statusCode == 400) {
      showSnakeBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);

    }
    return false;
  }


}
