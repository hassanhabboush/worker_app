class UnCompleteOrder {
 late int id;
 late int userId;
 // late void deliveryId;
 late int  workId;
 late String details;
 late String detailsAddress;
 late String lat;
 late String long;
 late String phone;
 late int status;
 late String createdAt;
 late String updatedAt;
 late Work work;
 // late List<void> photoOrder;


  UnCompleteOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    // deliveryId = json['delivery_id'];
    workId = json['work_id'];
    details = json['details'];
    detailsAddress = json['details_address'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    work = (json['work'] != null ? Work.fromJson(json['work']) : null)!;
    // if (json['photo_order'] != null) {
    //   // photoOrder = <Null>[];
    //   // json['photo_order'].forEach((v) {
    //   //   photoOrder.add(void.fromJson(v));
    //   // });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    // data['delivery_id'] = this.deliveryId;
    data['work_id'] = this.workId;
    data['details'] = this.details;
    data['details_address'] = this.detailsAddress;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['work'] = this.work.toJson();
    // data['photo_order'] = this.photoOrder!.map((v) => v.toJson()).toList();
    return data;
  }
}

class Work {
 late String name;
 late int id;

  Work.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}