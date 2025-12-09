import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'statistic_card.dart';

class StatisticsPanel extends StatelessWidget {
  final List<Expense> expenses;

  const StatisticsPanel({super.key, required this.expenses});

  double totalFor(Category c) {
    return expenses
        .where((e) => e.category == c)
        .fold(0, (sum, e) => sum + e.amount);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140, // slightly larger to fit card + padding
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        itemCount: Category.values.length,
        itemBuilder: (context, index) {
          final c = Category.values[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: StatisticCard(category: c, amount: totalFor(c)),
          );
        },
      ),
    );
  }
}
