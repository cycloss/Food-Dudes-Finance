import 'package:flutter/foundation.dart';

enum Category {
  Entertainment,
  Education,
  Shopping,
  Personal_Care,
  HealthFitness,
  FoodDining,
  GiftsDonations,
  BillsUtilities,
  AutoTransport,
  Travel
}

class Transaction {

  double amount;
  Category category;

  Transaction(this.amount, this.category);


}