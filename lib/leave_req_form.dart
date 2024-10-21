import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class LeaveRequestForm extends StatefulWidget {
  const LeaveRequestForm({super.key});

  @override
  _LeaveRequestFormState createState() => _LeaveRequestFormState();
}

class _LeaveRequestFormState extends State<LeaveRequestForm> {
  bool fullTime = false;
  bool firstHalf = false;
  bool secondHalf = false;
  DateTime? _fromDate;
  DateTime? _toDate;

  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
          _fromDateController.text = DateFormat.yMd().format(_fromDate!);

          if (_toDate != null && _toDate!.isBefore(_fromDate!)) {
            _toDate = null;
            _toDateController.clear();
          }
        } else {
          if (picked.isBefore(_fromDate ?? DateTime.now())) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('To date must be after From date')),
            );
            return;
          }
          _toDate = picked;
          _toDateController.text = DateFormat.yMd().format(_toDate!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text('Request for Leave'),
      ),
      body: Container(
        color: const Color(0xffFAFAFA),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Leave Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: [
                'Sick Leave',
                'Emergency Leave',
                'Casual Leave',
                'Vacation Leave',
                'Maternity Leave'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 10),
            const Text('Leave Time', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Checkbox(
                    activeColor: const Color(0xff75865C),
                    value: fullTime,
                    onChanged: (bool? value) {
                      setState(() {
                        fullTime = value!;
                        if (fullTime) {
                          firstHalf = false;
                          secondHalf = false;
                        }
                      });
                    }),
                const Text('Fulltime'),
                Checkbox(
                    activeColor: const Color(0xff75865C),
                    value: firstHalf,
                    onChanged: (bool? value) {
                      setState(() {
                        firstHalf = value!;
                        if (firstHalf) {
                          fullTime = false;
                          secondHalf = false;
                        }
                      });
                    }),
                const Text('First-Half'),
                Checkbox(
                    activeColor: const Color(0xff75865C),
                    value: secondHalf,
                    onChanged: (bool? value) {
                      setState(() {
                        secondHalf = value!;
                        if (secondHalf) {
                          fullTime = false;
                          firstHalf = false;
                        }
                      });
                    }),
                const Text('Second-Half'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _fromDateController,
                    readOnly: true,
                    onTap: () => _selectDate(context, true),
                    decoration: const InputDecoration(
                      labelText: 'From',
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _toDateController,
                    readOnly: true,
                    onTap: () => _selectDate(context, false),
                    decoration: const InputDecoration(
                      labelText: 'To',
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Give a short description about it',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
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
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: SvgPicture.asset(
                          'assets/svg_images/requestpic.svg',
                        ),
                        content: const Text(
                            textAlign: TextAlign.center,
                            'Your leave have been successfully requested.',
                            style: TextStyle(
                                color: Color(0xff202020),
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                      ),
                    );
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
                      'Request Leave',
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
