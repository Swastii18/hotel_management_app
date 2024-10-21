// import 'package:flutter/material.dart';

// class ReportInspectItemPage extends StatefulWidget {
//   const ReportInspectItemPage({super.key});

//   @override
//   _ReportInspectItemPageState createState() => _ReportInspectItemPageState();
// }

// class _ReportInspectItemPageState extends State<ReportInspectItemPage> {
//   bool missingItemsYes = false;
//   bool missingItemsNo = false;
//   bool damageYes = false;
//   bool damageNo = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffFAFAFA),
//       appBar: AppBar(
//         backgroundColor: const Color(0xffFAFAFA),
//         title: const Text('Report Items to Inspect'),
//       ),
//       body: Container(
//         color: const Color(0xffFAFAFA),
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Room Number',
//                 hintText: 'Enter room number',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Item Name',
//                 hintText: 'Enter Broken item name',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 labelText: 'Items to Inspect',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               items: ['Bed Linens', 'Toiletries', 'Drinks/Beverages', 'Other']
//                   .map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (value) {},
//             ),
//             const SizedBox(height: 20),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 labelText: 'Status of Item',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               items:
//                   ['Sufficient', 'Need Refill', 'Finished'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (value) {},
//             ),
//             const SizedBox(height: 20),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 labelText: 'Condition of Room',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               items:
//                   ['Clean', 'Needs cleaning', 'Damanged'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (value) {},
//             ),
//             const SizedBox(height: 20),
//             const Text('Any Missing Items?', style: TextStyle(fontSize: 16)),
//             Row(
//               children: [
//                 Checkbox(
//                     activeColor: const Color(0xff75865C),
//                     value: missingItemsYes,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         missingItemsYes = value!;
//                         if (missingItemsYes) missingItemsNo = false;
//                       });
//                     }),
//                 const Text('Yes'),
//                 Checkbox(
//                   activeColor: const Color(0xff75865C),
//                   value: missingItemsNo,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       missingItemsNo = value!;
//                       if (missingItemsNo) missingItemsYes = false;
//                     });
//                   },
//                 ),
//                 const Text('No'),
//               ],
//             ),
//             const SizedBox(height: 20),
//             const Text('Damage or Maintenance Required?',
//                 style: TextStyle(fontSize: 16)),
//             Row(
//               children: [
//                 Checkbox(
//                   activeColor: const Color(0xff75865C),
//                   value: damageYes,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       damageYes = value!;
//                       if (damageYes) damageNo = false;
//                     });
//                   },
//                 ),
//                 const Text('Yes'),
//                 Checkbox(
//                   activeColor: const Color(0xff75865C),
//                   value: damageNo,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       damageNo = value!;
//                       if (damageNo) damageYes = false;
//                     });
//                   },
//                 ),
//                 const Text('No'),
//               ],
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               maxLines: 3,
//               decoration: InputDecoration(
//                 labelText: 'Description of item (if any)',
//                 hintText: 'Give a short description of the item',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Reported by',
//                 hintText: 'Staff Name',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 OutlinedButton(
//                   onPressed: () {},
//                   style: OutlinedButton.styleFrom(
//                     padding: const EdgeInsets.all(10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const SizedBox(
//                     width: 150,
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       'Cancel',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.all(10),
//                     backgroundColor: const Color(0xff75865C),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const SizedBox(
//                     width: 150,
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       'Submit',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportInspectItemPage extends StatefulWidget {
  const ReportInspectItemPage({super.key});

  @override
  _ReportInspectItemPageState createState() => _ReportInspectItemPageState();
}

class _ReportInspectItemPageState extends State<ReportInspectItemPage> {
  final TextEditingController roomNumberController = TextEditingController();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController reportedByController = TextEditingController();

  String? selectedInspectItem;
  String? selectedStatusItem;
  String? selectedRoomCondition;
  bool missingItemsYes = false;
  bool missingItemsNo = false;
  bool damageYes = false;
  bool damageNo = false;

  Future<void> submitData() async {
    final url = Uri.parse('https://abc.com/api/report');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'roomNumber': roomNumberController.text,
        'itemName': itemNameController.text,
        'inspectItem': selectedInspectItem,
        'statusItem': selectedStatusItem,
        'roomCondition': selectedRoomCondition,
        'missingItems': missingItemsYes,
        'damage': damageYes,
        'description': descriptionController.text,
        'reportedBy': reportedByController.text,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Data submitted successfully'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to submit data'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text('Report Items to Inspect'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: roomNumberController,
              decoration: InputDecoration(
                labelText: 'Room Number',
                hintText: 'Enter room number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: itemNameController,
              decoration: InputDecoration(
                labelText: 'Item Name',
                hintText: 'Enter item name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Items to Inspect',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: ['Bed Linens', 'Toiletries', 'Drinks/Beverages', 'Other']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedInspectItem = value;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Status of Item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items:
                  ['Sufficient', 'Need Refill', 'Finished'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedStatusItem = value;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Condition of Room',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: ['Clean', 'Needs cleaning', 'Damaged'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRoomCondition = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Any Missing Items?', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Checkbox(
                    value: missingItemsYes,
                    onChanged: (bool? value) {
                      setState(() {
                        missingItemsYes = value!;
                        if (missingItemsYes) missingItemsNo = false;
                      });
                    }),
                const Text('Yes'),
                Checkbox(
                  value: missingItemsNo,
                  onChanged: (bool? value) {
                    setState(() {
                      missingItemsNo = value!;
                      if (missingItemsNo) missingItemsYes = false;
                    });
                  },
                ),
                const Text('No'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Damage or Maintenance Required?',
                style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Checkbox(
                  value: damageYes,
                  onChanged: (bool? value) {
                    setState(() {
                      damageYes = value!;
                      if (damageYes) damageNo = false;
                    });
                  },
                ),
                const Text('Yes'),
                Checkbox(
                  value: damageNo,
                  onChanged: (bool? value) {
                    setState(() {
                      damageNo = value!;
                      if (damageNo) damageYes = false;
                    });
                  },
                ),
                const Text('No'),
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
                  onPressed: () {
                    roomNumberController.clear();
                    itemNameController.clear();
                    descriptionController.clear();
                    reportedByController.clear();
                    setState(() {
                      missingItemsYes = false;
                      missingItemsNo = false;
                      damageYes = false;
                      damageNo = false;
                      selectedInspectItem = null;
                      selectedStatusItem = null;
                      selectedRoomCondition = null;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: SizedBox(
                    width: screenWidth * 0.4,
                    child: const Text(
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
                  child: SizedBox(
                    width: screenWidth * 0.4,
                    child: const Text(
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
