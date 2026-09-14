import 'package:flutter/cupertino.dart';

class CalcController extends ChangeNotifier{

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
    notifyListeners();
  }

  String calculateResult(String expression) {
    try {
      String finalExpression = expression.replaceAll('x', '*').replaceAll('÷', '/');

      List<String> list = [];
      String currentNumber = '';

      for (int i = 0; i < finalExpression.length; i++) {
        String char = finalExpression[i];

        if (['+', '-', '*', '/','%'].contains(char)) {
          if (char == '-' && (i == 0 || ['+', '-', '*', '/','%'].contains(finalExpression[i - 1]))) {
            currentNumber += char;
          } else {
            list.add(currentNumber);
            list.add(char);
            currentNumber = '';
          }
        } else {
          currentNumber += char;
        }
      }
      if (currentNumber.isNotEmpty) {
        list.add(currentNumber);
      }

      for (int i = 1; i < list.length - 1; i += 2) {
        if (list[i] == '*' || list[i] == '/') {
          double left = double.parse(list[i - 1]);
          double right = double.parse(list[i + 1]);
          double temp = list[i] == '*' ? (left * right) : (left / right);

          list[i - 1] = temp.toString();
          list.removeRange(i, i + 2);
          i -= 2;
        }
      }

      for (int i = 1; i < list.length - 1; i += 2) {
        if (list[i] == '+' || list[i] == '-') {
          double left = double.parse(list[i - 1]);
          double right = double.parse(list[i + 1]);
          double temp = list[i] == '+' ? (left + right) : (left - right);

          list[i - 1] = temp.toString();
          list.removeRange(i, i + 2);
          i -= 2;
        }
      }

      double finalResult = double.parse(list[0]);

      if (finalResult.isInfinite || finalResult.isNaN) return 'Error';

      if (finalResult == finalResult.toInt()) {
        return finalResult.toInt().toString();
      }

      return finalResult.toStringAsFixed(8).replaceFirst(RegExp(r'\.?0+$'), '');

    } catch (e) {
      return 'Error';
    }
  }

}