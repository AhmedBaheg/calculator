import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomOutLineBtn extends StatelessWidget {
  const CustomOutLineBtn({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    required this.child,
    this.borderColor,
    required this.isClicked,
  });

  final VoidCallback onPressed;
  final double? width, height;
  final Widget child;
  final Color? borderColor;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          // backgroundColor: isClicked ? AppColors.green : AppColors.transparent,
          // foregroundColor: isClicked ? AppColors.white : AppColors.green,
          padding: EdgeInsets.zero,
          side: BorderSide(color: borderColor ?? const Color(0xFF000000)),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        child: child,
      ),
    );
  }
}
