import 'dart:ui';

import 'package:calculator/core/utils/app_colors.dart';

class CalcButtonModel {
  String? text;
  Color? color;

  CalcButtonModel({required this.text, required this.color});
}

List<CalcButtonModel> calcList = [
  CalcButtonModel(text: 'C', color: AppColors.btnNumColor3),
  CalcButtonModel(text: '-/+', color: AppColors.btnNumColor3),
  CalcButtonModel(text: '%', color: AppColors.btnNumColor3),
  CalcButtonModel(text: '÷', color: AppColors.btnNumColor2),
  CalcButtonModel(text: '7', color: AppColors.btnNumColor),
  CalcButtonModel(text: '8', color: AppColors.btnNumColor),
  CalcButtonModel(text: '9', color: AppColors.btnNumColor),
  CalcButtonModel(text: 'x', color: AppColors.btnNumColor2),
  CalcButtonModel(text: '4', color: AppColors.btnNumColor),
  CalcButtonModel(text: '5', color: AppColors.btnNumColor),
  CalcButtonModel(text: '6', color: AppColors.btnNumColor),
  CalcButtonModel(text: '-', color: AppColors.btnNumColor2),
  CalcButtonModel(text: '1', color: AppColors.btnNumColor),
  CalcButtonModel(text: '2', color: AppColors.btnNumColor),
  CalcButtonModel(text: '3', color: AppColors.btnNumColor),
  CalcButtonModel(text: '+', color: AppColors.btnNumColor2),
  CalcButtonModel(text: '.', color: AppColors.btnNumColor),
  CalcButtonModel(text: '0', color: AppColors.btnNumColor),
  CalcButtonModel(text: 'Dele', color: AppColors.btnNumColor),
  CalcButtonModel(text: '=', color: AppColors.btnNumColor2),
];
