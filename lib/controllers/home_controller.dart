import 'package:expense_app/models/expense.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var _expenses = <Expense>[].obs;
  var _categoryAmountMap = <String, double>{}.obs;
  RxList<Expense> get expenses => _expenses;
  RxMap<String, double> get categoryAmountMap => _categoryAmountMap;

  void addExpense(Expense expense) {
    _expenses.add(expense);
    addExpensePie(expense);
  }

  void addExpensePie(Expense expense) {
    if (_categoryAmountMap.containsKey(expense.category)) {
      _categoryAmountMap[expense.category] =
          _categoryAmountMap[expense.category]! + expense.amount;
    } else {
      _categoryAmountMap[expense.category] = expense.amount;
    }
  }
}
