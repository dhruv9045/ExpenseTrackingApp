import 'package:expense_app/controllers/home_controller.dart';
import 'package:expense_app/models/expense.dart';
import 'package:get/get.dart';

class AddExpenseController extends GetxController {
  var title = ''.obs;
  var amount = 0.0.obs;
  var category = 'Food'.obs; // Default category
  var titleError = Rxn<String>();
  var amountError = Rxn<String>();

  void saveExpense() {
    if (title.value.isEmpty) {
      titleError.value = 'Please enter a title';
      return;
    } else {
      titleError.value = null;
    }

    if (amount.value <= 0) {
      amountError.value = 'Please enter a valid amount';
      return;
    } else {
      amountError.value = null;
    }

    Expense expense = Expense(
      title: title.value,
      amount: amount.value,
      category: category.value,
    );
    Get.find<HomeController>().addExpense(expense);
    Get.back();
  }
}
