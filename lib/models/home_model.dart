// class HomeModel {
//   bool? status;
//   DataModel? data;

//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? DataHomeModel.fromJson(json['data']) : null;
//   }
// }

// class DataModel {
//   List<BannersModel> banners = [];
//   List<ProductModel> products = [];

//   DataModel.fromJson(Map<String, dynamic> json) {
//     // bannars & products are lists ... so i have to add it like this :
//     json['banners'].forEach((element) {
//       banners.add(element);
//     });
//     json['products'].forEach((element) {
//       products.add(element);
//     });
//   }
// }

// class BannersModel {
//   int? id;
//   String? image;

//   BannersModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//   }
// }

// class ProductModel {
//   int? id;
//   dynamic price;
//   dynamic oldPrice;
//   dynamic disCount;
//   String? name;
//   String? image;
//   bool? inFavorite;
//   bool? inCart;

//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     disCount = json['discount'];
//     name = json['name'];
//     image = json['image'];
//     inFavorite = json['in_favorites'];
//     inCart = json['in_cart'];
//   }
// }

class HomeModel {
  bool? status;
  DataHomeModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? DataHomeModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataHomeModel {
  List<BannersModel> banners = [];
  List<ProductsModel> products = [];
  String? ad;

  DataHomeModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <BannersModel>[];
      json['banners'].forEach((v) {
        banners.add(BannersModel.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <ProductsModel>[];
      json['products'].forEach((v) {
        products.add(ProductsModel.fromJson(v));
      });
    }
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['banners'] = banners.map((v) => v.toJson()).toList();

    data['products'] = products.map((v) => v.toJson()).toList();

    data['ad'] = ad;
    return data;
  }
}

class BannersModel {
  int? id;
  String? image;
  CategoryHomeModel? category;

  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'] != null
        ? CategoryHomeModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    if (category != null) {
      data['category'] = category!.toJson();
    }

    return data;
  }
}

class CategoryHomeModel {
  int? id;
  String? image;
  String? name;

  CategoryHomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    return data;
  }
}

class ProductsModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  late String image;
  late String name;
  bool? inFavorites;
  bool? inCart;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['discount'] = discount;
    data['image'] = image;
    data['name'] = name;
    data['in_favorites'] = inFavorites;
    data['in_cart'] = inCart;
    return data;
  }
}
