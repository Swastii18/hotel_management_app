import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleApp extends StatefulWidget {
  const ScheduleApp({super.key});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class Task {
  final String title;
  final String location;
  final String time;

  Task(this.title, this.location, this.time);
}

class _ScheduleScreenState extends State<ScheduleApp> {
  final Map<String, List<Task>> tasks = {
    '2024-10-19': [
      Task('Clean Hallway Areas', 'Ground Floor', '9 AM - 9:30 AM'),
      Task('Clean the Glass of Lobby and Hallways', 'Lobby/1st Floor',
          '9:30 AM - 10:30 AM'),
      Task('Checkout Cleaning', '2nd Floor', '10:45 AM - 11:30 AM'),
    ],
    '2024-10-21': [
      Task('Clean Hallway Areas', 'Ground Floor', '9 AM - 9:30 AM'),
      Task('Clean the Glass of Lobby and Hallways', 'Lobby/1st Floor',
          '9:30 AM - 10:30 AM'),
      Task('Checkout Cleaning', '2nd Floor', '10:45 AM - 11:30 AM'),
    ],
  };

  DateTime currentDate = DateTime.now();
  String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    super.initState();

    _updateToCurrentDate();
  }

  void _updateToCurrentDate() {
    setState(() {
      currentDate = DateTime.now();
      selectedDate = DateFormat('yyyy-MM-dd').format(currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          _buildMonthYearHeader(),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _buildDateList(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: tasks[selectedDate]?.length ?? 0,
              itemBuilder: (context, index) {
                final task = tasks[selectedDate]?[index];
                return _buildTaskCard(task);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthYearHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              currentDate = DateTime(currentDate.year, currentDate.month - 1);
            });
          },
        ),
        Text(
          DateFormat('MMMM yyyy').format(currentDate),
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            setState(() {
              currentDate = DateTime(currentDate.year, currentDate.month + 1);
            });
          },
        ),
      ],
    );
  }

  List<Widget> _buildDateList() {
    List<Widget> dateWidgets = [];
    int daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i++) {
      DateTime date = DateTime(currentDate.year, currentDate.month, i);
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      String dayOfWeek = DateFormat('E').format(date);

      dateWidgets.add(
        _buildDateItem(formattedDate, dayOfWeek, i.toString()),
      );
    }
    return dateWidgets;
  }

  Widget _buildTaskCard(Task? task) {
    if (task == null) {
      return const Center(child: Text('No tasks for this date.'));
    }
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.time,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff5B6A46),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              task.location,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff787878),
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDateItem(String date, String day, String dayNumber) {
    bool isSelected = date == selectedDate;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = date;
        });
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.topStart,
              height: 25,
              width: 80,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xff75865C)
                    : const Color(0xffAFBC9A),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              dayNumber,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              day,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
