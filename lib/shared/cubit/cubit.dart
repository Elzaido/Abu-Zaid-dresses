// ignore_for_file: non_constant_identifier_names

import 'package:abu_zaid/network/end_point.dart';
import 'package:abu_zaid/network/remote/dio_helper.dart';
import 'package:abu_zaid/shared/cubit/state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPass = true;

  void scureChange() {
    isPass = !isPass;
    emit(ChangeScureState());
  }

  void loginCubit({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFaildState(error));
    });
  }
}
