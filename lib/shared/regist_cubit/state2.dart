import 'package:abu_zaid/models/login_model.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class ChangeScureState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final ShopLoginModel loginModel;

  RegisterSuccessState(this.loginModel);
}
