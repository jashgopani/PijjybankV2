import 'package:flutter/material.dart';

class Category {
  final IconData categoryIcon;
  final String categoryName;

  Category(this.categoryIcon, this.categoryName);
}

final List<Category> categories = [
  Category(Icons.fastfood, "Food"),
  Category(Icons.local_grocery_store, "General"),
  Category(Icons.face,"Personal Care"),
  Category(Icons.local_mall,"Shopping"),
  Category(Icons.transfer_within_a_station,"Transport")
];
