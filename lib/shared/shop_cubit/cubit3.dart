// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls
import 'package:abu_zaid/models/categories_model.dart';
import 'package:abu_zaid/models/favorite_get_model.dart';
import 'package:abu_zaid/models/favorite_post_model.dart';
import 'package:abu_zaid/models/home_model.dart';
import 'package:abu_zaid/models/login_model.dart';
import 'package:abu_zaid/modules/categories.dart';
import 'package:abu_zaid/modules/favoraite.dart';
import 'package:abu_zaid/modules/products.dart';
import 'package:abu_zaid/modules/settings.dart';
import 'package:abu_zaid/network/end_point.dart';
import 'package:abu_zaid/network/remote/dio_helper.dart';
import 'package:abu_zaid/shared/constant/constant.dart';
import 'package:abu_zaid/shared/shop_cubit/state3.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(InitialShopState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool isFavorite = false;
  // late Map<int, bool> favorites;

  List<Widget> navPages = [
    Products(),
    Categories(),
    Favoraite(),
    Settings(),
  ];

  void changeNav(index) {
    currentIndex = index;
    emit(ChangeNavShopState());
  }

  List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Products'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  HomeModel? homeModel;
  Map<int, bool> favorite = {};

  void getData() {
    emit(ShopLoadingState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(token);
      homeModel!.data!.products.forEach((element) {
        favorite.addAll({element.id: element.inFavorites});
        // print(favorite.toString());
      });
      emit(ShopSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(ShopErrorState());
    });
  }

  CategoriesModel? categoryModel;

  void getCategoryData() {
    DioHelper.getData(url: GET_GATEGORIES, token: token).then((value) {
      categoryModel = CategoriesModel.fromJson(value.data);
      emit(ShopCategorySuccessState());
    }).catchError((onError) {
      print(onError);
      emit(ShopCategoryErrorState());
    });
  }

  late FavoriteGetModel favoriteGetModel;

  void getFavoriteData() {
    DioHelper.getData(url: FAVORITE, token: token).then((value) {
      favoriteGetModel = FavoriteGetModel.fromJson(value.data);
      print(value.data);
      emit(ShopFavoriteSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(ShopFavoriteErrorState());
    });
  }

  late FavoritePostModel favoritePostModel;

  void changeFavorite(int productId) {
    emit(ShopChangeFavoriteState());
    DioHelper.postData(
            url: FAVORITE, data: {'product_id': productId}, token: token)
        .then((value) {
      favoritePostModel = FavoritePostModel.fromJson(value.data);
      print(value.data);
      if (!favoritePostModel.status) {
        favorite[productId] = true;
      } else {
        getFavoriteData();
      }
      emit(ShopChangeFavoriteSuccessState());
    }).catchError((error) {
      emit(ShopChangeFavoriteErrorState());
    });
  }

  // void changeFavoriteIcon(int id) {
  //   isFavorite = !isFavorite;
  //   favorites = {id: isFavorite};
  // }

  late ShopLoginModel userData;

  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userData = ShopLoginModel.fromJson(value.data);
      print(userData.data!.name);
      emit(ShopSuccessUserDataState());
    }).catchError((onError) {
      print(onError);
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserDataState());
    DioHelper.putData(url: UPDATE_PROFILE, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
    }).then((value) {
      userData = ShopLoginModel.fromJson(value.data);
      print(userData.data!.name);
      emit(ShopSuccessUpdateUserDataState());
    }).catchError((onError) {
      print(onError);
      emit(ShopErrorUpdateUserDataState());
    });
  }
}
