import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ReportLostItemPage extends StatelessWidget {
  const ReportLostItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text('Report Lost Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          color: const Color(0xffFAFAFA),
          padding: const EdgeInsets.all(16),
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
                  child: Column(
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
                        onPressed: () {},
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
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Item Name',
                  hintText: 'Enter lost item name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Description of item',
                  hintText: 'Give a short description about it',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
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
                    onPressed: () {},
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
                    onPressed: () {},
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
      ),
    );
  }
}
