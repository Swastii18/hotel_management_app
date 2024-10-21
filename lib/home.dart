import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'attendance.dart';
import 'item_cleaning.dart';
import 'item_inspection.dart';
import 'item_lost_found.dart';
import 'item_maintenance.dart';
import 'notification_page.dart';
import 'profile.dart';
import 'schedule.dart';
import 'task_assigned.dart';
import 'taskcard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> tasks = [
    {
      'roomNumber': '201',
      'floor': '2nd Floor',
      'task': 'Room Cleaning Needed',
      'status': 'Checked-out',
      'recordedAt': '25 Jul 2024, 12:57 am',
      'progress': 'In Progress',
    },
    {
      'roomNumber': '301',
      'floor': '3rd Floor',
      'task': 'Maintenance Required',
      'status': 'Vacant',
      'recordedAt': '25 Jul 2024, 1:00 pm',
      'progress': 'Pending',
    },
    {
      'roomNumber': '203',
      'floor': '2nd Floor',
      'task': 'Inspection Required',
      'status': 'Vacant',
      'recordedAt': '25 Jul 2024, 3:00 pm',
      'progress': 'In Progress',
    }
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    int assignedTaskCount = tasks.length;

    return Scaffold(
      // appBar: _currentIndex != 0
      //     ? null
      //     :
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: const SizedBox(
            child: Row(
          children: [
            Text(
              "Welcome",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Text(" Staff",
                style: TextStyle(
                    color: Color(0xff87986A),
                    fontSize: 18,
                    fontWeight: FontWeight.w700))
          ],
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(),
                  ),
                );
              },
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: 4, end: 2),
                showBadge: false,
                child: SizedBox(
                  child: SvgPicture.asset(
                    'assets/svg_images/notificationbell.svg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xffFAFAFA),
        padding: const EdgeInsets.all(16),
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Choose Category",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          childAspectRatio: 1.3,
                          children: [
                            _buildCard(
                              'assets/svg_images/inspection.svg',
                              'Page 1',
                              const Color(0xffF3F6FC),
                              "Inspection",
                              const Color(0xffE7EEF7),
                              ItemInspection().itemsInspection.length,
                              const Color(0xff629BCE),
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemInspection(),
                                  ),
                                );
                              },
                            ),
                            _buildCard(
                              'assets/svg_images/maintenance.svg',
                              'Page 2',
                              const Color(0xffFFF4F4),
                              "Maintenance",
                              const Color(0xffFFDFDF),
                              ItemMaintenance().itemsBroken.length,
                              const Color(0xffFF6F61),
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemMaintenance(),
                                  ),
                                );
                              },
                            ),
                            _buildCard(
                              'assets/svg_images/cleaning.svg',
                              'Page 3',
                              const Color(0xffF5FFF1),
                              "Cleaning",
                              const Color(0xffDCFCE3),
                              ItemCleaning().itemsCleaning.length,
                              const Color(0xff4BDD6D),
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemCleaning(),
                                  ),
                                );
                              },
                            ),
                            _buildCard(
                              'assets/svg_images/lostfound.svg',
                              'Page 4',
                              const Color(0xffFFFCF2),
                              "Lost and Found",
                              const Color(0xffFFE8BE),
                              LostFoundItems(
                                itemsFound: const [],
                                itemsLost: const [],
                              ).totalItems,
                              const Color(0xffFFC567),
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LostFoundItems(
                                      itemsFound: const [],
                                      itemsLost: const [],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Task Assigned",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: const Color(0xff75865C),
                              radius: 12,
                              child: Text(
                                "$assignedTaskCount",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskCardPage(tasks: tasks),
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
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xffFFFFFF),
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
                ],
              ),
              const AttendancePage(),
              const ScheduleApp(),
              const ProfilePage(),
            ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff5B6A46),
        unselectedItemColor: const Color(0xff787878),
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        items: List.generate(4, (index) {
          final List<Map<String, String>> navItems = [
            {'icon': 'assets/svg_images/home.svg', 'label': 'Home'},
            {'icon': 'assets/svg_images/attendance.svg', 'label': 'Attendance'},
            {'icon': 'assets/svg_images/schedule.svg', 'label': 'Schedule'},
            {'icon': 'assets/svg_images/profile.svg', 'label': 'Profile'},
          ];

          return BottomNavigationBarItem(
            icon: _buildNavItem(navItems[index]['icon']!, index),
            label: navItems[index]['label'],
          );
        }),
      ),
    );
  }

  Widget _buildNavItem(String iconPath, int index) {
    final isSelected = _currentIndex == index;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? const Color(0xff5B6A46) : const Color(0xff787878),
          BlendMode.srcATop,
        ),
      ),
    );
  }
}

Widget _buildCard(
    String assetPath,
    String pageTitle,
    Color backgroundColor,
    String name,
    Color badgeBorder,
    int badgeTask,
    Color badgeTaskColor,
    VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 150,
      child: Card(
        elevation: 2,
        color: backgroundColor,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(assetPath),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 14,
              top: 8,
              child: badge(
                badgeBorder: badgeBorder,
                badgeTask: badgeTask,
                badgeTaskColor: badgeTaskColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class badge extends StatelessWidget {
  Color badgeBorder;
  final int badgeTask;
  Color badgeTaskColor;

  badge({
    super.key,
    required this.badgeBorder,
    required this.badgeTask,
    required this.badgeTaskColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: badgeBorder, width: 2),
      ),
      child: Center(
        child: Text(
          badgeTask.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: badgeTaskColor,
          ),
        ),
      ),
    );
  }
}
