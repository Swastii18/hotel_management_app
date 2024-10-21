import 'package:flutter/material.dart';

import 'my_ticket_section.dart';

class MyTicketPage extends StatelessWidget {
  final List<Map<String, String?>> leaves;

  const MyTicketPage({super.key, required this.leaves});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        title: const Text("My Ticket"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Color(0xffF2F2F2),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: ListView.builder(
            itemCount: leaves.length,
            itemBuilder: (context, index) {
              final task = leaves[index];
              return MyTicketSection(
                status: task['status']!,
                recordedAt: task['recordedAt']!,
                request: task['request']!,
                leavePeriod: task['leavePeriod']!,
              );
            },
          ),
        ),
      ),
    );
  }
}
