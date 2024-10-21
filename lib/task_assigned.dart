import 'package:flutter/material.dart';
import 'package:maintenance_app/task_handle.dart';

class TaskCard extends StatelessWidget {
  final String roomNumber;
  final String floor;
  final String task;
  final String status;
  final String recordedAt;
  final String progress;

  const TaskCard({
    super.key,
    required this.roomNumber,
    required this.floor,
    required this.task,
    required this.status,
    required this.recordedAt,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskHandle(
              roomNumber: roomNumber,
              floor: floor,
              task: task,
              status: status,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
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
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Text(roomNumber,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff970000))),
                        Text('/ $floor'),
                      ],
                    ),
                    Text(
                      status,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Text(task,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          progress == "In Progress"
                              ? Icons.circle
                              : Icons.access_time,
                          size: 10,
                          color: progress == "In Progress"
                              ? Colors.green
                              : Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          progress,
                          style: TextStyle(
                            color: progress == "In Progress"
                                ? Colors.green
                                : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      recordedAt,
                      style: TextStyle(
                        color: recordedAt == "In Progress"
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
