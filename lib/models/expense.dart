class Expense {
  final int? id;
  final DateTime date;
  final double amount;
  final String description;
  Expense ({
    this.id,
    required this.date,
    required this.amount,
    required this.description,
});
}