import 'package:calculator/core/utils/app_colors.dart';
import 'package:calculator/features/home/data/controller/calc_controller.dart';
import 'package:calculator/features/home/data/model/calc_button_model.dart';
import 'package:calculator/features/home/presentation/screen/widgets/build_keyboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/build_expression_widget.dart';
import 'widgets/build_result_widget.dart';
import 'widgets/build_button_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: Column(
          crossAxisAlignment: .end,
          mainAxisAlignment: .end,
          children: [
            BuildExpressionWidget(value: context.watch<CalcController>().value),
            SizedBox(height: 20),
            BuildResultWidget(result: context.watch<CalcController>().result),
            SizedBox(height: 20),
            BuildKeyboardWidget(
              itemBuilder: (context, index) => BuildButtonItemWidget(
                model: calcList[index],
                onPressed: (){
                  context.read<CalcController>().onPressedKey(calcList[index].text!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
