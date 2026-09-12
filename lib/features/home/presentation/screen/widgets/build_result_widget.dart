import 'package:calculator/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BuildResultWidget extends StatelessWidget {
  const new({
    super.key,
    required this.result,
  });

  final String? result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerRight,
        child: Text(
          result ?? '0',
          style: TextStyle(fontSize: 64, color: AppColors.white),
        ),
      ),
    );
  }
}
