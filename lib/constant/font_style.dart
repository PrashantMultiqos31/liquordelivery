import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquordelivery/constant/color_constant.dart';

class AppFontStyle {
  BuildContext context;

  AppFontStyle(this.context);

  static const textFieldNormal = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
  );
  static const textFieldBold = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
      fontFamily: 'Poppins');

  static const themeStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  );
  static const normalTextSize = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
      fontFamily: 'Poppins');
  static const smallSizeFont = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
      fontFamily: 'Poppins');
  static const smallSize = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
      fontFamily: 'Poppins');
  static const textFieldTitle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
      fontFamily: 'Poppins');
  static const textFieldPrice = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
      fontFamily: 'Poppins');
  static const viewAll = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.lightYellow,
    fontFamily: 'Poppins',
  );

  static const viewAllSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.lightYellow,
    fontFamily: 'Poppins',
  );
  static const yellowBoldColor = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.lightYellow,
    fontFamily: 'Poppins',
  );

  static const appBarName = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
    fontFamily: 'Poppins',
  );
}
