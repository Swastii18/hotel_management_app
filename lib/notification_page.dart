import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "time": "1m ago"
    },
    {
      "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "time": "7m ago"
    },
    {
      "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "time": "9m ago"
    },
    {
      "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "time": "9m ago"
    },
  ];

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xffFAFAFA),
      ),
      body: Container(
        color: const Color(0xffFAFAFA),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationTile(
              message: notifications[index]['message']!,
              time: notifications[index]['time']!,
            );
          },
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String message;
  final String time;

  const NotificationTile(
      {super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg_images/notificationAlert.svg',
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              time,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
