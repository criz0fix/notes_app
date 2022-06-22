import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/config/themes/app_color.dart';

import '../../core/utils/consts.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColor.white,
      scaffoldBackgroundColor: AppColor.black2,
      cardColor: AppColor.black,
      cardTheme: const CardTheme(
        margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
      ),
      iconTheme: const IconThemeData(color: AppColor.white, size: 24),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColor.black))),
      textTheme: TextTheme(
        headline1: const TextStyle(
            fontSize: 43.0, fontWeight: FontWeight.w600, color: Colors.white),
        headline2: GoogleFonts.nunito(
          textStyle: const TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        headline3: GoogleFonts.nunito(
          textStyle: const TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        headline4: GoogleFonts.nunito(
          textStyle: const TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w400,
            color: AppColor.white,
          ),
        ),
        bodyText1: GoogleFonts.nunito(
          textStyle: const TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        bodyText2: GoogleFonts.nunito(
          textStyle: const TextStyle(
            color: AppColor.grey,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColor.black2),
        backgroundColor: AppColor.black2,
        centerTitle: false,
        toolbarHeight: appBarToolbarHeight,
        titleTextStyle: GoogleFonts.nunito(
          textStyle: const TextStyle(
              color: AppColor.white,
              fontSize: 43.0,
              fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        //actionsIconTheme: const IconThemeData(color: AppColor.white),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.black,
        iconSize: 38,
      ),
    );
  }
}
