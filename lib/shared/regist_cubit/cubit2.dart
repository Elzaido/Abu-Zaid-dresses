// ignore_for_file: non_constant_identifier_names

import 'package:abu_zaid/models/login_model.dart';
import 'package:abu_zaid/network/end_point.dart';
import 'package:abu_zaid/network/remote/dio_helper.dart';
import 'package:abu_zaid/shared/regist_cubit/state2.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  ShopLoginModel? loginModel;
  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPass2 = true;

  void scureChange2() {
    isPass2 = !isPass2;
    emit(ChangeScureState());
  }

  void registerCubit({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    emit(LoadingRegisterState());

    DioHelper.postData(url: REGISTER, data: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    }).then((value) {
      //data is acually a map ... so i can put it here :
      loginModel = ShopLoginModel.fromJson(value.data);
      // ignore: avoid_print
      print(loginModel!.data!.token);
      emit(RegisterSuccessState(loginModel!));
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(RegisterSuccessState(loginModel!));
    });
  }
}
