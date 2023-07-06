import 'package:worker_app/models/user.dart';

class BaseResponse<T> {
  late int code;
  late bool success;
  late String message;
  late List<T> data;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    // data = (json['data'] != null ? new User.fromJson(json['data']) : null)!;
    if (json['date'] != null) {
      data = <T>[];
      json['data'].forEach((v) {
        data.add(User.fromJson(v) as T);
      });
    }
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['code'] = this.code;
//   data['success'] = this.success;
//   data['message'] = this.message;
//   if (this.data != null) {
//     data['data'] = this.data!.toJson();
//   }
//   return data;
// }
}
