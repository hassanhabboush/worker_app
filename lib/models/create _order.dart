import 'package:worker_app/models/photo_order.dart';
import 'package:worker_app/models/worke.dart';

class CreateOrder {
  late int id;
  late int userId;
  late String deliveryId;
  late String workId;
  late String details;
  late String detailsAddress;
  late String lat;
  late String long;
  late String phone;
  late int status;
  late String createdAt;
  late String updatedAt;
  late List<PhotoOrder> photoOrder;
  late Work work;

  CreateOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    deliveryId = json['delivery_id'] ?? "No delivery ID";
    workId = json['work_id'];
    details = json['details'];
    detailsAddress = json['details_address'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['photo_order'] != null) {
      photoOrder = <PhotoOrder>[];
      json['photo_order'].forEach((v) {
        photoOrder.add(new PhotoOrder.fromJson(v));
      });
    }
    work = (json['work'] != null ? new Work.fromJson(json['work']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['delivery_id'] = this.deliveryId;
    data['work_id'] = this.workId;
    data['details'] = this.details;
    data['details_address'] = this.detailsAddress;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['photo_order'] = this.photoOrder.map((v) => v.toJson()).toList();
    data['work'] = this.work.toJson();
    return data;
  }
}
