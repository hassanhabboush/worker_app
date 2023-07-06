
class User {
 late int id;
 late String name;
 late String email;
 late String photo;
 late String phone;
 late String active;
 late String token;


  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    phone = json['phone'];
    active = json['active'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['phone'] = this.phone;
    data['active'] = this.active;
    data['token'] = this.token;
    return data;
  }
}