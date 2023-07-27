import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_app/screens/home_screen.dart';
import 'package:expense_app/screens/add_expense_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Expense Tracker App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/add_expense', page: () => AddExpenseScreen()),
      ],
    );
  }
}
