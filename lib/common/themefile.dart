import 'package:flutter/material.dart';
import 'package:liquordelivery/constant/color_constant.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
      highlightColor: AppColors.lightBackGround,
      shadowColor: AppColors.white,
     canvasColor: AppColors.white,
      cardColor: AppColors.lightBackGround,
      buttonColor: AppColors.black,
      bottomAppBarColor: AppColors.lightYellow



    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: AppColors.white,
        ),
      ),
      highlightColor: AppColors.darkColorTheme,
      bottomAppBarColor: AppColors.lightYellow,
        buttonColor: AppColors.white,
        cardColor: AppColors.lightPurpleTheme,
      canvasColor: AppColors.darkColorTheme,
      shadowColor: AppColors.lightColorTheme
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
