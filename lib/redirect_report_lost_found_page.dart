import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'report_found_item.dart';
import 'report_lost_item.dart';

class RedirectReportLostFoundPage extends StatelessWidget {
  const RedirectReportLostFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text('Lost and Found Items'),
      ),
      body: Container(
        color: const Color(0xffFAFAFA),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFAFAFA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportLostItemPage()));
              },
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg_images/reportLostItem.svg',
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'I want to report lost item',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFAFAFA),
                shape: RoundedRectangleBorder(
                  
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportFoundItemPage()));
              },
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg_images/reportFoundItem.svg',
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'I want to report found item',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
