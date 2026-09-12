import 'package:calculator/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BuildExpressionWidget extends StatelessWidget {
  const new({
    super.key,
    required this.value,
  });

  final String? value;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          alignment: Alignment.centerRight,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              value ?? '0',
              style: TextStyle(
                fontSize: 48,
                color: AppColors.white.withValues(alpha: 0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
