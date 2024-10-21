import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'leave_req_form.dart';
import 'my_ticket_page.dart';
import 'my_ticket_section.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        title: const Text("Attendance"),
        backgroundColor: const Color(0xffFAFAFA),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffFAFAFA),
          child: Column(
            children: [
              Container(
                color: const Color(0xffFFFFFF),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: DonutPieChart(),
                    ),
                    LegendWidget(),
                  ],
                ),
              ),
              TicketCard(),
              const SizedBox(height: 30),
              Container(
                width: 220,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xffFFFFFF)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Request for Leave",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff232323),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LeaveRequestForm(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xff75865C),
                        radius: 15,
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DonutPieChart extends StatelessWidget {
  const DonutPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PieChart(
        PieChartData(
          sections: _createSampleData(),
          centerSpaceRadius: 60,
          sectionsSpace: 2,
        ),
      ),
    );
  }
}

List<PieChartSectionData> _createSampleData() {
  return [
    PieChartSectionData(
      color: const Color(0xff87986A),
      value: 80,
      title: '21 days',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color(0xffAFBC9A),
      value: 10,
      title: '3 days',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color.fromARGB(255, 225, 148, 142),
      value: 10,
      title: '3 days',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: const Color(0xffFF6F61),
      value: 6,
      title: '2 days',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];
}

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLegendItem(const Color(0xFF87986A), 'Present Days'),
              const SizedBox(height: 8),
              _buildLegendItem(const Color(0xFFAFBC9A), 'Late Check-in'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLegendItem(const Color(0xFEE1948E), 'Early Check-out'),
              const SizedBox(height: 8),
              _buildLegendItem(const Color(0xFFFF6F61), 'Absent'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff787878),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class TicketCard extends StatelessWidget {
  TicketCard({super.key});

  final List<Map<String, String>> leaves = [
    {
      'status': 'Approved',
      'recordedAt': '4 Jul 2024, 12:57 am',
      'request': 'Sick Leave Request',
      'leavePeriod': '5 Jul - 10 Jul, 2024',
    },
    {
      'status': 'Denied',
      'recordedAt': '25 Jun 2024, 12:57 am',
      'request': 'Casual Leave Request',
      'leavePeriod': '28 Jun - 30 Jun, 2024',
    },
    {
      'status': 'Approved',
      'recordedAt': ' 9 Jun 2024, 12:57 am',
      'request': 'Sick Leave Request',
      'leavePeriod': '10 Jun - 11 Jun, 2024',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "My Ticket",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyTicketPage(leaves: leaves),
                ),
              );
            },
            child: const Text(
              "See All",
              style: TextStyle(
                color: Color(0xff75865C),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      Container(
        color: const Color(0xffFFFFFF),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            final leave = leaves[index];
            return MyTicketSection(
              status: leave['status']!,
              recordedAt: leave['recordedAt']!,
              request: leave['request']!,
              leavePeriod: leave['leavePeriod']!,
            );
          },
        ),
      ),
    ]);
  }
}
