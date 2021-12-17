class FavoritePostModel {
  late bool status;
  late String message;

  Map json = <String, dynamic>{};

  FavoritePostModel.fromJson(json) {
    status = json['status'];
    message = json['message'];
  }
}
