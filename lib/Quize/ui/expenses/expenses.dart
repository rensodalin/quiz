// import 'package:flutter/material.dart';
// import '../../models/expense.dart';

// class ExpensesView extends StatelessWidget {
//   final List<Expense> expenses;
//   final Function(Expense)? onRemoveExpense;

//   const ExpensesView({super.key, required this.expenses, this.onRemoveExpense});

//   @override
//   Widget build(BuildContext context) {
//     if (expenses.isEmpty) {
//       return const Center(
//         child: Text(
//           "No expenses yet. Add some!",
//           style: TextStyle(fontSize: 16),
//         ),
//       );
//     }

//     return ListView.builder(
//       itemCount: expenses.length,
//       itemBuilder: (context, index) {
//         final expense = expenses[index];

//         return Dismissible(
//           key: ValueKey(
//             expense.id,
//           ), 
//           direction: DismissDirection.endToStart,

//           onDismissed: (_) {
//             onRemoveExpense?.call(expense);

//             ScaffoldMessenger.of(context)
//               ..clearSnackBars()
//               ..showSnackBar(
//                 SnackBar(
//                   content: const Text("Expense deleted"),
//                   action: SnackBarAction(
//                     label: "Undo",
//                     onPressed: () {
//                       // Parent must restore the removed item in its list
//                     },
//                   ),
//                 ),
//               );
//           },
//           child: ExpenseItem(expense: expense),
//         );
//       },
//     );
//   }
// }

// class ExpenseItem extends StatelessWidget {
//   final Expense expense;

//   const ExpenseItem({super.key, required this.expense});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(10),
//       child: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   expense.title,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Text("${expense.amount.toStringAsFixed(2)} \$"),
//               ],
//             ),
//             const Spacer(),
//             Row(
//               children: [
//                 Icon(iconForCategory(expense.category)),
//                 const SizedBox(width: 6),
//                 Text(
//                   "${expense.date.day}/${expense.date.month}/${expense.date.year}",
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
      itemBuilder: (context, index) {
        final expense = expenses[index];

        return Dismissible(
          key: ValueKey(expense.id),
          direction: DismissDirection.endToStart,

          // Only call parent remove — NO SnackBar here
          onDismissed: (_) {
            onRemoveExpense?.call(expense);
          },

          background: Container(
            color: Colors.red,
            padding: const EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            child: const Icon(Icons.delete, color: Colors.white),
          ),

          child: ExpenseItem(expense: expense),
        );
      },
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
