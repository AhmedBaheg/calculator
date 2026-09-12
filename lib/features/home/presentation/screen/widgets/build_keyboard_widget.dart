import 'package:calculator/core/utils/app_colors.dart';
import 'package:calculator/features/home/data/model/calc_button_model.dart';
import 'package:flutter/material.dart';

class BuildKeyboardWidget extends StatelessWidget {
  const BuildKeyboardWidget({super.key, required this.itemBuilder});

  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.08),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        itemCount: calcList.length,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
