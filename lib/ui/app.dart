



import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'expenses/expense_form.dart';
import 'expenses/expenses.dart';
import 'statistics/statistics_panel.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Expense> _expenses = [];

  void _addExpense(Expense e) {
    setState(() {
      _expenses.add(e);
    });
  }

  void _openForm() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => ExpenseForm(onCreateExpense: _addExpense),
    );
  }

  void _removeExpense(Expense expense) {
    final removedIndex = _expenses.indexOf(expense);

    setState(() {
      _expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense removed.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(removedIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text("Ronan-The-Best Expenses App"),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: _openForm),
        ],
      ),
      body: Column(
        children: [
          StatisticsPanel(expenses: _expenses),
          Expanded(
            child: ExpensesView(
              expenses: _expenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
