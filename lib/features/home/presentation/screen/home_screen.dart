import 'package:calculator/core/utils/app_colors.dart';
import 'package:calculator/features/home/data/model/calc_button_model.dart';
import 'package:calculator/features/home/presentation/screen/widgets/build_keyboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'widgets/build_expression_widget.dart';
import 'widgets/build_result_widget.dart';
import 'widgets/build_button_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? value, result;

  void onPressedKey(String key) {
    switch (key) {
      case "C":
        value = "0";
        result = "0";

      case "-/+":
        if (value!.startsWith('-')) {
          value = value?.substring(1);
        } else if (value!.isNotEmpty && value != '0') {
          value = '-$value';
        }

      case "Dele":
        if ((value ?? '0').length > 1) {
          value = value!.substring(0, value!.length - 1);
        } else {
          value = "0";
        }

      case "=":
        if (value == "0" || value == null) {
          result = value ?? "0";
        } else {
          result = calculateResult(value!);
        }

      default:
        if (value == null || value == "0") {
          value = key;
        } else {
          value = value! + key;
        }
    }
  }

  String calculateResult(String expression) {
    try {
      // 1. تحويل علامات الضرب والقسمة للشكل اللي المكتبة بتفهمه
      String finalExpression = expression
          .replaceAll('x', '*')
          .replaceAll('÷', '/');

      // 2. ترجمة النص لمعادلة رياضية حقيقية
      Parser p = Parser();
      Expression exp = p.parse(finalExpression);

      // 3. تجهيز بيئة العمل (بنسيبها فاضية لعدم وجود متغيرات زي x و y)
      ContextModel cm = ContextModel();

      // 4. حساب النتيجة النهائية
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // التأكد من عدم القسمة على صفر (لأنها بتدي مالا نهاية)
      if (eval.isInfinite || eval.isNaN) {
        return "Error";
      }

      // 5. لو النتيجة رقم صحيح (مثال: 5.0) بنشيل الكسر ونرجعه (5)
      if (eval == eval.toInt()) {
        return eval.toInt().toString();
      }

      // لو رقم عشري (مثال: 5.5) بنرجعه زي ما هو
      return eval.toString();

    } catch (e) {
      // 6. لو اليوزر كتب معادلة غلط، بنرجع Error بدل ما التطبيق يقفل
      return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: Column(
          crossAxisAlignment: .end,
          mainAxisAlignment: .end,
          children: [
            BuildExpressionWidget(value: value),
            SizedBox(height: 20),
            BuildResultWidget(result: result),
            SizedBox(height: 20),
            BuildKeyboardWidget(
              itemBuilder: (context, index) => BuildButtonItemWidget(
                model: calcList[index],
                onPressed: (){
                  onPressedKey(calcList[index].text!);
                  setState(() {

                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
