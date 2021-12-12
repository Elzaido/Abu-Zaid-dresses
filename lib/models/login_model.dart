// الفكرة من المودل إني بدي أستقبل الداتا عليه
class ShopLoginModel {
  bool? status;
  String? message;
  UserData? data;

  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    //needs a parsing becuase it is an object :
    data = json['data'] != null ? UserData.fromJason(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

// a named constructor used to get the data from APIs :

  UserData.fromJason(Map<String, dynamic> json) {
    id = json['id'];
    credit = json['credit'];
    email = json['email'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    points = json['points'];
    token = json['token'];
  }
}
