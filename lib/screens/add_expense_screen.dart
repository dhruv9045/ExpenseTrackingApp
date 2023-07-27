import 'package:expense_app/controllers/add_expese_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpenseScreen extends StatelessWidget {
  final AddExpenseController _controller = Get.put(AddExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  _controller.title.value = value;
                  _controller.titleError.value = null;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  errorText: _controller.titleError.value,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  _controller.amount.value = double.tryParse(value) ?? 0;
                  _controller.amountError.value = null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  errorText: _controller.amountError.value,
                ),
              ),
              SizedBox(height: 16),
              Obx(
                () => DropdownButton<String>(
                  value: _controller.category.value,
                  onChanged: (value) => _controller.category.value = value!,
                  items: ['Food', 'Transportation', 'Utilities', 'Other']
                      .map((category) => DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _controller.saveExpense,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
