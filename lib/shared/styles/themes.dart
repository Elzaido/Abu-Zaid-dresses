import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
    // it is better to make every theme on separate :
    primarySwatch: Colors.deepOrange,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange,
    ),
    appBarTheme: AppBarTheme(
        // for dealing with status bar i must make it as false :
        backwardsCompatibility: false,
        // for status bar :
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        )),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
        bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 10,
    ));

ThemeData darkTheme = ThemeData(
    // it is better to make every theme on separate :
    primarySwatch: Colors.deepOrange,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange,
    ),
    appBarTheme: AppBarTheme(
        // for dealing with status bar i must make it as false :
        backwardsCompatibility: false,
        // for status bar :
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: HexColor('333739'),
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        )),
    scaffoldBackgroundColor: HexColor('333739'),
    textTheme: TextTheme(
        bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: HexColor('333739'),
      unselectedItemColor: Colors.white70,
      selectedItemColor: Colors.deepOrange,
      elevation: 10,
    ));
