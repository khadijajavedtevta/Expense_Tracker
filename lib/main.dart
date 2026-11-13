import 'package:flutter/material.dart';
import 'models/expense.dart';
void main() {
  runApp(const ExpenseTrackerApp());
}
class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp( {super.key});
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'Expense Tracker',
    home: const HomeScreen(),
    );
    }
  }
  class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});
  @override
    State<HomeScreen> createState() => _HomeScreenState();
  }
  class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> expenses = [];
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  void addExpense(){
    final amount = double.tryParse(amountController.text);
    if (amount==null || descriptionController.text.isEmpty) return;
    setState((){
      expenses.add(Expense(
        date: selectedDate,
        amount: amount,
        description: descriptionController.text,
      ));
      amountController.clear();
      descriptionController.clear();
    });
  }
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expense Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
            const SizedBox(height: 10),
      ElevatedButton(onPressed: addExpense, child: const Text("Add Expense")),
            const Divider(height: 30),
            Expanded(
              child: ListView.builder(itemCount: expenses.length,
              itemBuilder: (context, index){
                final e = expenses[index];
                return ListTile(
                  title: Text(e.description),
                    subtitle: Text(e.date.toString().split(' ')[0]),
                  trailing: Text("Rs. ${e.amount.toStringAsFixed(2)}"),
                );
              },),
            ),
          ],
        ),
      ),
    );
  }
  }