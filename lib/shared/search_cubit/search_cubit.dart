import 'package:abu_zaid/models/search_model.dart';
import 'package:abu_zaid/network/end_point.dart';
import 'package:abu_zaid/network/remote/dio_helper.dart';
import 'package:abu_zaid/shared/constant/constant.dart';
import 'package:abu_zaid/shared/search_cubit/search_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitialSearchState());

  static SearchCubit get(context) => BlocProvider.of(context);
  SearchPostModel? model;

  void search({
    required String text,
  }) {
    emit(LoadingSaerchState());

    DioHelper.postData(url: SEARCH, token: token, data: {
      'text': text,
    }).then((value) {
      //data is acually a map ... so i can put it here :
      model = SearchPostModel.fromJson(value.data);
      // ignore: avoid_print
      print(model!.data);
      emit(SuccessSearchState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(ErrorSearchState());
    });
  }
}
