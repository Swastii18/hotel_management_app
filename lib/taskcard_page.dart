import 'package:flutter/material.dart';

import 'task_assigned.dart';

class TaskCardPage extends StatelessWidget {
  final List<Map<String, String?>> tasks;

  const TaskCardPage({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Task Details"),
            DropDownMenu(),
          ],
        ),
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
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskCard(
                roomNumber: task['roomNumber']!,
                floor: task['floor']!,
                task: task['task']!,
                status: task['status']!,
                recordedAt: task['recordedAt']!,
                progress: task['progress']!,
              );
            },
          ),
        ),
      ),
    );
  }
}

const List<String> list = <String>[
  'Sort by',
  'Sort by Alphabet',
  'Sort by Price'
];

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.filter_list_rounded, size: 16),
          const SizedBox(width: 10),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down, size: 16),
            underline: Container(),
            isDense: true,
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
