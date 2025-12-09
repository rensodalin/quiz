
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesView extends StatelessWidget {
  final List<Expense> expenses;
  final Function(Expense)? onRemoveExpense;

  const ExpensesView({super.key, required this.expenses, this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return const Center(
        child: Text(
          "No expenses yet. Add some!",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(
        expense: expenses[index],
        onRemove: () => onRemoveExpense?.call(expenses[index]),
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  final VoidCallback? onRemove;

  const ExpenseItem({super.key, required this.expense, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${expense.amount.toStringAsFixed(2)} \$"),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Icon(iconForCategory(expense.category)),
                const SizedBox(width: 6),
                Text(
                  "${expense.date.day}/${expense.date.month}/${expense.date.year}",
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onRemove,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
