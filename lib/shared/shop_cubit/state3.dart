abstract class ShopState {}

class InitialShopState extends ShopState {}

class ChangeNavShopState extends ShopState {}

class ShopLoadingState extends ShopState {}

class ShopSuccessState extends ShopState {}

class ShopErrorState extends ShopState {}

class ShopCategorySuccessState extends ShopState {}

class ShopCategoryErrorState extends ShopState {}
