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

// not used for now :

  // UserData({
  //   this.id,
  //   this.credit,
  //   this.email,
  //   this.image,
  //   this.name,
  //   this.phone,
  //   this.points,
  //   this.token,
  // });

// a named constructor :

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
