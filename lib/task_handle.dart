import 'package:flutter/material.dart';

class TaskHandle extends StatefulWidget {
  final String roomNumber;
  final String floor;
  final String status;
  final String task;

  const TaskHandle({
    super.key,
    required this.roomNumber,
    required this.floor,
    required this.status,
    required this.task,
  });

  @override
  TaskHandleState createState() => TaskHandleState();
}

class TaskHandleState extends State<TaskHandle> {
  Map<String, bool> checkBoxValues = {
    'Beverages Refill': false,
    'Shampoo': false,
    'Mineral Water': false,
    'Towel': false,
    'Extra Blanket': false,
    'Soap': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        title: const Text('Task Details'),
        backgroundColor: const Color(0xffFAFAFA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Room No.',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Text(widget.roomNumber,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff970000))),
                            Text('/ ${widget.floor}'),
                          ],
                        ),
                        Text(
                          widget.status,
                          style: const TextStyle(
                              color: Color(0xff787878),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.task,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Things Required',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 1,
              color: Colors.white,
              child: SizedBox(
                height: 500.0,
                child: ListView(
                  children: checkBoxValues.keys.map((label) {
                    return _buildCheckBoxItem(label);
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const SizedBox(
                    width: 150,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Pause Task',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: const Color(0xff75865C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const SizedBox(
                    width: 150,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Task Completed',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckBoxItem(String label) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: const Color(0xff75865C),
              value: checkBoxValues[label],
              onChanged: (value) {
                setState(() {
                  checkBoxValues[label] = value ?? false;
                });
              },
            ),
            Text(label),
          ],
        ),
      ],
    );
  }
}
