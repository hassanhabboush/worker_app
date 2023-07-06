import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_app/models/create%20_order.dart';
import 'package:worker_app/models/user.dart';

enum PrefKeys {
  loggedIn,
  id,
  name,
  email,
  photo,
  phone,
  active,
  token,
  onBoard,
  details,
  detailsAddress,
  lat,
  long
}

class UserPreferencesController {
  static final UserPreferencesController _instance =
      UserPreferencesController._internal();
  late SharedPreferences _sharedPreferences;

  factory UserPreferencesController() {
    return _instance;
  }

  UserPreferencesController._internal();

  Future<void> intSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUser(
      {required User user}) async {
    _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    _sharedPreferences.setString(PrefKeys.name.name, user.name);
    _sharedPreferences.setString(PrefKeys.email.name, user.email);
    _sharedPreferences.setString(PrefKeys.photo.name, user.photo);
    _sharedPreferences.setString(PrefKeys.phone.name, user.phone);
    _sharedPreferences.setString(PrefKeys.active.name, user.active);
    _sharedPreferences.setString(PrefKeys.token.name, "Bearer ${user.token}");
    _sharedPreferences.setBool(PrefKeys.onBoard.name, true);
  }

  Future<void> saveOrder({required CreateOrder createOrder}) async{
    _sharedPreferences.setString(PrefKeys.photo.name, createOrder.photoOrder as String);
    _sharedPreferences.setString(PrefKeys.phone.name, createOrder.phone);
    _sharedPreferences.setString(PrefKeys.details.name, createOrder.details);
    _sharedPreferences.setString(
        PrefKeys.detailsAddress.name, createOrder.detailsAddress);
    _sharedPreferences.setString(PrefKeys.lat.name, createOrder.lat);
    _sharedPreferences.setString(PrefKeys.long.name, createOrder.long);
  }

  // bool get loggedIn => _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;
  // bool get onBoard => _sharedPreferences.getBool(PrefKeys.onBoard.name) ?? false;

  String get token => _sharedPreferences.getString(PrefKeys.token.name) ?? '';

  //
  // T? getValueFor<T>(PrefKeys key) {
  //   if (_sharedPreferences.containsKey(key.name)) {
  //     return _sharedPreferences.get(key.name) as T;
  //   }
  //   return null;
  // }

  T? getValueFor<T>(PrefKeys key) {
    if (_sharedPreferences.containsKey(key.name)) {
      dynamic value = _sharedPreferences.get(key.name);
      if (value is T) {
        return value;
      }
    }
    return null;
  }

  Future<bool> deleteValueFor(String key) async {
    return _sharedPreferences.containsKey(key)
        ? await _sharedPreferences.remove(key)
        : false;
  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }

// Future<bool> logOut() async {
//   return await _sharedPreferences.clear();
// }
}
