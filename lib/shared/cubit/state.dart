import 'package:abu_zaid/models/shop_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class ChangeScureState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final ShopLoginModel loginModel;

  LoginSuccessState(this.loginModel);
}
