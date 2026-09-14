import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'features/home/data/controller/calc_controller.dart';
import 'features/home/presentation/screen/home_screen.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ChangeNotifierProvider(
        create: (BuildContext context) => CalcController(),
        child: MaterialApp(debugShowCheckedModeBanner: false, home: child),
      ),
      child: HomeScreen(),
    );
  }
}
