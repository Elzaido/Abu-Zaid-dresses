// ignore_for_file: avoid_print
import 'package:abu_zaid/models/categories_model.dart';
import 'package:abu_zaid/models/home_model.dart';
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
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Stettings'),
  ];

  HomeModel? homeModel;

  void getData() {
    emit(ShopLoadingState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      print(homeModel!.data!.banners[0].image.toString());
      print(homeModel!.status.toString());
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
}
