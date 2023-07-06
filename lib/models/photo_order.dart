class PhotoOrder {
 late int id;
 late String photo;
 late int orderId;
 late String createdAt;
 late String updatedAt;


  PhotoOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    orderId = json['order_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['order_id'] = this.orderId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
