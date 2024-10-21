import 'package:flutter/material.dart';

class PasswordChange extends StatelessWidget {
  const PasswordChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text('Password and Privacy'),
      ),
      body: Container(
        color: const Color(0xffFAFAFA),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Old Password',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Enter old Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'New Password',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Enter new Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Confirm Password',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Re-type new Password',
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
                      'Update Password',
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
