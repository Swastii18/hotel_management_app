import 'package:flutter/material.dart';

import 'report_inspection_item.dart';

class ItemInspection extends StatelessWidget {
  final List<Map<String, dynamic>> itemsInspection = [
    {
      'room': 'Room No. 101',
      'floor': '2nd Floor',
      'title': 'Room Checkout',
      'recordedAt': '25 Jul 2024, 11:27 am',
    },
    {
      'room': 'Room No. 401',
      'floor': '4th Floor',
      'title': 'Susceptible Inspection',
      'recordedAt': '01 Jul 2024, 1:07 am',
    },
    {
      'room': 'Room No. 405',
      'floor': '4th Floor',
      'title': 'Suspcious Item',
      'recordedAt': '01 Jul 2024, 1:07 am',
    },
  ];

  ItemInspection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text('Inspection'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportInspectItemPage()));
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
        padding: const EdgeInsets.all(16),
        color: const Color(0xffFAFAFA),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Items to Inspect '),
                    Text(
                      '(${itemsInspection.length})',
                      style: const TextStyle(color: Color(0xff75865C)),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: itemsInspection.length,
                itemBuilder: (context, index) {
                  final item = itemsInspection[index];
                  return Card(
                    color: const Color(0xffFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                item['room'] ?? '',
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
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
                          const SizedBox(height: 10),
                          Text(
                            item['title'] ?? '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Reported on: ${item['recordedAt']}',
                            style: const TextStyle(
                                color: Color(0xff787878),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 165,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(10),
                                    backgroundColor: const Color(0xffFFFFFF),
                                    side: const BorderSide(color: Colors.black),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Ignore',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 165,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(10),
                                    backgroundColor: const Color(0xff75865C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Inspect',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          )
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
