import 'package:abu_zaid/models/favorite_post_model.dart';

abstract class ShopState {}

class InitialShopState extends ShopState {}

class ChangeNavShopState extends ShopState {}

class ShopLoadingState extends ShopState {}

class ShopSuccessState extends ShopState {}

class ShopErrorState extends ShopState {}

class ShopCategorySuccessState extends ShopState {}

class ShopCategoryErrorState extends ShopState {}

class ShopChangeFavoriteSuccessState extends ShopState {}

class ShopChangeFavoriteState extends ShopState {
  // final FavoriteDataModel favoriteDataModel;

  // ShopChangeFavoriteState(this.favoriteDataModel);
}

class ShopChangeFavoriteErrorState extends ShopState {}

class ShopChangeFavoriteLoadingState extends ShopState {}

class ShopFavoriteSuccessState extends ShopState {}

class ShopFavoriteErrorState extends ShopState {}
