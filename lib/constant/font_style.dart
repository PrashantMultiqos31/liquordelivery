import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquordelivery/constant/color_constant.dart';

class AppFontStyle {
  BuildContext context;

  AppFontStyle(this.context);

  static const textFieldNormal = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
  );
  static const textFieldBold = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w200,
      color: AppColors.black,
      fontFamily: 'OpenSans');

  static const themeStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w200,
    fontFamily: 'OpenSans',
  );
  static const normalTextSize = TextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontFamily: 'OpenSans');
  static const smallSizeFont = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      fontFamily: 'OpenSans');
  static const smallSize = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200,
      color: AppColors.black,
      fontFamily: 'OpenSans');
  static const textFieldTitle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w200,
      color: AppColors.black,
      fontFamily: 'OpenSans');
  static const textFieldPrice = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      fontFamily: 'OpenSans');
  static const viewAll = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.lightYellow,
    fontFamily: 'OpenSans',
  );

  static const viewAllSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.lightYellow,
    fontFamily: 'Poppins',
  );
  static const yellowBoldColor = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.lightYellow,
    fontFamily: 'Poppins',
  );

  static const appBarName = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: 'Poppins',
  );
}
