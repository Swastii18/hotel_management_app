import 'package:flutter/material.dart';

import 'redirect_report_lost_found_page.dart';

class LostFoundItems extends StatelessWidget {
  int get totalItems => itemsFound.length + itemsLost.length;
  final List<Map<String, dynamic>> itemsFound = [
    {
      'imageUrl':
          'https://cdn.pixabay.com/photo/2013/07/13/12/21/charge-159709_1280.png',
      'room': 'Room No. 101',
      'floor': '2nd Floor',
      'title': 'Samsung Charger',
      'recordedAt': '25 Jul 2024, 11:27 am',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/2081332/pexels-photo-2081332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'room': 'Room No. 401',
      'floor': '4th Floor',
      'title': 'Customer left Bag',
      'recordedAt': '01 Jul 2024, 1:07 am',
    },
  ];

  final List<Map<String, dynamic>> itemsLost = [
    {
      'imageUrl':
          'https://cdn.pixabay.com/photo/2013/07/13/12/21/charge-159709_1280.png',
      'room': 'Room No. 102',
      'floor': '2nd Floor',
      'title': 'Lost Keys',
      'recordedAt': '26 Jul 2024, 10:15 am',
    },
    {
      'imageUrl':
          'https://cdn.pixabay.com/photo/2013/07/13/12/21/charge-159709_1280.png',
      'room': 'Room No. 403',
      'floor': '6th Floor',
      'title': 'Wallet Found',
      'recordedAt': '02 Jul 2024, 2:00 pm',
    },
  ];

  LostFoundItems(
      {super.key, required List itemsFound, required List itemsLost});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFAFAFA),
          title: const Text('Lost and Found'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RedirectReportLostFoundPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F5F0),
                  side: const BorderSide(
                    color: Color(0xff75865C),
                  ),
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
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Row(
                children: [
                  const Text(
                    'Items Found ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '(${itemsFound.length})',
                    style: const TextStyle(color: Color(0xff75865C)),
                  )
                ],
              )),
              Tab(
                  child: Row(
                children: [
                  const Text('Items Lost ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  Text(
                    '(${itemsLost.length})',
                    style: const TextStyle(color: Color(0xff75865C)),
                  )
                ],
              )),
            ],
          ),
        ),
        body: Container(
          color: const Color(0xffFAFAFA),
          child: TabBarView(
            children: [
              _buildItemList(itemsFound),
              _buildItemList(itemsLost),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemList(List<Map<String, dynamic>> items) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  color: const Color(0xffFFFFFF),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                                color: const Color(0xff9C9C9C), width: 1.0),
                          ),
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
    );
  }
}
