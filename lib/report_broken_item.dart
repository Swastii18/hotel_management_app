import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ReportBrokenItemPage extends StatefulWidget {
  const ReportBrokenItemPage({super.key});

  @override
  ReportBrokenItemPageState createState() => ReportBrokenItemPageState();
}

class ReportBrokenItemPageState extends State<ReportBrokenItemPage> {
  final TextEditingController roomNumberController = TextEditingController();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController reportedByController = TextEditingController();

  String? selectedDamageController;
  String? selectedAddressDepartment;

  File? itemImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> submitData() async {
    final url = Uri.parse('https://hhh.com/api/broken');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'roomNumber': roomNumberController.text,
        'itemName': itemNameController.text,
        'description': descriptionController.text,
        'submittedBy': reportedByController.text,
        'damageItem': selectedDamageController,
        'addressDepartment': selectedAddressDepartment,
      }),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Submitted Successfully.'),
      ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to save data')));
    }
  }

  Future<void> imagePicker() async {
    final XFile? brokenImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (brokenImage != null) {
      setState(() {
        itemImage = File(brokenImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        title: const Text('Report Broken Item'),
        backgroundColor: const Color(0xffFAFAFA),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xffFAFAFA),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: 'Room Number',
                hintText: 'Enter room number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DottedBorder(
              color: Colors.grey,
              strokeWidth: 2,
              dashPattern: const [8, 4],
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              child: Container(
                height: 200,
                alignment: Alignment.center,
                child: itemImage == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.cloud_upload,
                              size: 40, color: Colors.grey),
                          const SizedBox(height: 10),
                          const Text('Drag your file(s) to start uploading'),
                          const SizedBox(height: 10),
                          const Text('OR'),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: imagePicker,
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(color: Color(0xff75865C)),
                              backgroundColor: const Color(0xffFAFAFA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Browse files',
                                style: TextStyle(color: Color(0xff75865C))),
                          ),
                        ],
                      )
                    : Image.file(
                        itemImage!,
                        fit: BoxFit.fill,
                        width: 150,
                        height: 150,
                      ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Item Name',
                hintText: 'Enter Broken item name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Description of Damage',
                hintText: 'Give a short description about it',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Severity of Damage',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: ['Low', 'Medium', 'High', 'Extreme'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDamageController = value;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Which department should I address?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: [
                'Plumber',
                'Electrician',
                'Mechanic',
                'Painter',
                'Carpenter',
                'Mason',
                'Other'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedAddressDepartment = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
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
                  onPressed: () {
                    roomNumberController.clear();
                    itemNameController.clear();
                    descriptionController.clear();
                    reportedByController.clear();
                    setState(() {
                      selectedAddressDepartment = null;
                      selectedDamageController = null;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const SizedBox(
                    width: 150,
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
                    padding: const EdgeInsets.all(10),
                    backgroundColor: const Color(0xff75865C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const SizedBox(
                    width: 150,
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
