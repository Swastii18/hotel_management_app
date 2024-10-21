import 'package:flutter/material.dart';

import 'report_broken_item.dart';

class ItemMaintenance extends StatelessWidget {
  final List<Map<String, dynamic>> itemsBroken = [
    {
      'imageUrl':
          'https://cdn.pixabay.com/photo/2013/07/13/12/21/charge-159709_1280.png',
      'room': 'Room No. 101',
      'floor': '2nd Floor',
      'title': 'Tap is Leaking',
      'recordedAt': '25 Jul 2024, 11:27 am',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/2081332/pexels-photo-2081332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'room': 'Room No. 401',
      'floor': '4th Floor',
      'title': 'Doorknob is broken',
      'recordedAt': '01 Jul 2024, 1:07 am',
    },
  ];

  ItemMaintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text('Maintenance'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReportBrokenItemPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF4F5F0),
                side: const BorderSide(color: Color(0xff75865C)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                '+ Add items',
                style: TextStyle(color: Color(0xff75865C)),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xffFAFAFA),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Items to repair '),
                    Text(
                      '(${itemsBroken.length})',
                      style: const TextStyle(color: Color(0xff75865C)),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: itemsBroken.length,
                itemBuilder: (context, index) {
                  final item = itemsBroken[index];
                  return Card(
                    color: const Color(0xffFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.network(
                              item['imageUrl'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      item['room'] ?? '',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '/ ${item['floor'] ?? ''}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff787878)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['title'] ?? '',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Reported on: ${item['recordedAt']}',
                                  style: const TextStyle(
                                      color: Color(0xff787878),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
