// ignore_for_file: avoid_print, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:abu_zaid/modules/login.dart';
import 'package:abu_zaid/layout/shop_layout.dart';
import 'package:abu_zaid/network/local/cache_helper.dart';
import 'package:abu_zaid/network/remote/dio_helper.dart';
import 'package:abu_zaid/shared/bloc_observer.dart';
import 'package:abu_zaid/shared/constant/constant.dart';
import 'package:abu_zaid/shared/login_cubit/cubit.dart';
import 'package:abu_zaid/shared/regist_cubit/cubit2.dart';
import 'package:abu_zaid/shared/shop_cubit/cubit3.dart';
import 'package:abu_zaid/shared/styles/themes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/on_boarding.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  // this fucking line is so important :
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  Widget widget;
  if (onBoarding != null) {
    if (token != null) {
      widget = ShopLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoarding();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  const MyApp(this.startWidget);

  final Widget startWidget;
  @override
  Widget build(BuildContext context) {
    // if there is a cubit that used in th whole app ... i need to provide it here :
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(create: (context) => ShopCubit()..getData())
      ],
      child: MaterialApp(
        // if we skip the on boarding before application will lead us to the login screen :
        home: startWidget,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
