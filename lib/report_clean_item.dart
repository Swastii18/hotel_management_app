import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportCleanItemPage extends StatefulWidget {
  const ReportCleanItemPage({super.key});

  @override
  _ReportCleanItemPageState createState() => _ReportCleanItemPageState();
}

class _ReportCleanItemPageState extends State<ReportCleanItemPage> {
  final TextEditingController roomNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController reportedByController = TextEditingController();

  Map<String, bool> checkBoxClean = {
    'Bed': false,
    'Bathroom': false,
    'Floor': false,
    'Window': false,
    'Lobby': false,
    'Living': false,
    'Other': false,
  };

  bool removed = false;
  bool notRemoved = false;

  Future<void> submitData() async {
    final url = Uri.parse('http://clean.com/api/report');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'roomNumber': roomNumberController.text,
        'description': descriptionController.text,
        'reportedBy': reportedByController.text,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Submitted Successfully'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to submit data'),
      ));
    }
  }

  void clearForm() {
    roomNumberController.clear();
    descriptionController.clear();
    reportedByController.clear();
    setState(() {
      checkBoxClean.updateAll((key, value) => false);
      removed = false;
      notRemoved = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text('Report Items to Clean'),
      ),
      body: Container(
        color: const Color(0xffFAFAFA),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: roomNumberController,
              decoration: InputDecoration(
                labelText: 'Room Number',
                hintText: 'Enter room number',
                fillColor: const Color(0xffFFFFFF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Areas to Clean',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 2,
              color: const Color(0xffFFFFFF),
              child: SizedBox(
                height: 400.0,
                child: ListView(
                  children: checkBoxClean.keys.map((label) {
                    return Row(
                      children: [
                        Checkbox(
                          activeColor: const Color(0xff75865C),
                          value: checkBoxClean[label],
                          onChanged: (value) {
                            setState(() {
                              checkBoxClean[label] = value ?? false;
                            });
                          },
                        ),
                        Text(label),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Trash Removal', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Checkbox(
                    activeColor: const Color(0xff75865C),
                    value: removed,
                    onChanged: (bool? value) {
                      setState(() {
                        removed = value ?? false;
                        if (removed) notRemoved = false;
                      });
                    }),
                const Text('Removed'),
                Checkbox(
                  activeColor: const Color(0xff75865C),
                  value: notRemoved,
                  onChanged: (bool? value) {
                    setState(() {
                      notRemoved = value ?? false;
                      if (notRemoved) removed = false;
                    });
                  },
                ),
                const Text('Not Removed'),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description of item (if any)',
                hintText: 'Give a short description of the item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: reportedByController,
              decoration: InputDecoration(
                labelText: 'Reported by',
                hintText: 'Staff Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: clearForm,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const SizedBox(
                    width: 130,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Cancel',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    submitData();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff75865C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const SizedBox(
                    width: 130,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Submit',
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
}
