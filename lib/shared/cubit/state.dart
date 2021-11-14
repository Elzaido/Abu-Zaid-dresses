abstract class LoginState {}

class LoginInitialState extends LoginState {}

class ChangeScureState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFaildState extends LoginState {
  String? error;

  LoginFaildState(this.error);
}
