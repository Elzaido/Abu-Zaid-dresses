import 'package:abu_zaid/models/login_model.dart';
import 'package:abu_zaid/network/end_point.dart';
import 'package:abu_zaid/network/remote/dio_helper.dart';
import 'package:abu_zaid/shared/login_cubit/state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  // الأوبجكت بساعدني أوصل للداتا
  ShopLoginModel? loginModel;
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
      //data is acually a map ... so i can put it here :
      loginModel = ShopLoginModel.fromJson(value.data);
      // ignore: avoid_print
      print(loginModel!.data!.token);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(LoginSuccessState(loginModel!));
    });
  }
}
