import 'package:calculator/core/utils/app_colors.dart';
import 'package:calculator/features/home/data/model/calc_button_model.dart';
import 'package:flutter/material.dart';

class BuildButtonItemWidget extends StatelessWidget {
  const new({super.key, required this.model, required this.onPressed});

  final CalcButtonModel model;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: model.color!,
          foregroundColor: AppColors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          model.text!,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
