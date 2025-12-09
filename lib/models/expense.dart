import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}

IconData iconForCategory(Category c) {
  switch (c) {
    case Category.food:
      return Icons.fastfood;
    case Category.travel:
      return Icons.flight;
    case Category.leisure:
      return Icons.movie;
    case Category.work:
      return Icons.work;
  }
}
