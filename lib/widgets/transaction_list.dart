import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> userTransactions;
  final Function deleteTransaction;
  const TransactionList(
      {super.key,
      required this.userTransactions,
      required this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: userTransactions.isEmpty
            ? LayoutBuilder(
                builder: (ctx, constraints) {
                  return Column(
                    children: [
                      Text(
                        'No Transactions Added Yet',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.7,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                },
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 35,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: FittedBox(
                                child: Text(
                              '\$${userTransactions[index].amount}',
                              style: const TextStyle(color: Colors.white),
                            ))),
                      ),
                      title: Text(
                        '${userTransactions[index].title}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      subtitle: Text(
                        '${DateFormat.yMMMd().format(userTransactions[index].date)}',
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: MediaQuery.of(context).size.width > 360
                          ? TextButton.icon(
                              onPressed: () {
                                deleteTransaction(userTransactions[index].id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              label: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                deleteTransaction(userTransactions[index].id);
                              },
                            ),
                    ),
                  );
                },
                itemCount: userTransactions.length,
              ));
  }
}
