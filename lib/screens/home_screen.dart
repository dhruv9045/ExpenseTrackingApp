import 'package:expense_app/constants/colors.dart';
import 'package:expense_app/controllers/home_controller.dart';
import 'package:expense_app/models/expense.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    List<Expense> expenses = _controller.expenses;
    Map<String, double> categoryAmountMap = _controller.categoryAmountMap;

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Obx(
        () => Column(
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: PieChart(
                  PieChartData(
                    sections: categoryAmountMap.entries
                        .map(
                          (entry) => PieChartSectionData(
                            color: AppColors.colorList[categoryAmountMap.keys
                                    .toList()
                                    .indexOf(entry.key) %
                                AppColors.colorList.length],
                            value: entry.value,
                            title: '\$${entry.value.toStringAsFixed(2)}',
                            radius: 60,
                            titleStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        )
                        .toList(),
                    centerSpaceRadius: 30,
                    sectionsSpace: 0,
                    startDegreeOffset: -90,
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  Expense expense = expenses[index];
                  return ListTile(
                    title: Text(expense.title),
                    subtitle: Text('${expense.amount}'),
                    trailing: Text(expense.category),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add_expense');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
