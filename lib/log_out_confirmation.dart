import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_page.dart';

class LogOutConfirmation extends StatelessWidget {
  const LogOutConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text('Log Out'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48, left: 8, right: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffFFFFFF),
            border: Border.all(
              color: const Color(0xffFAFAFA),
              width: 2.0,
            ),
          ),
          padding: const EdgeInsets.all(16),
          height: 300,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/svg_images/logoutconfirm.svg',
              ),
              const SizedBox(height: 20),
              const Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xff121417),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Are you sure you want to log out?",
                style: TextStyle(
                  color: Color(0xff7B7B7B),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      backgroundColor: const Color(0xffFFFFFF),
                      padding: const EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const SizedBox(
                      width: 150,
                      child: Text(
                        'Stay Logged in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(14),
                      backgroundColor: const Color(0xff75865C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const SizedBox(
                      width: 150,
                      child: Text(
                        'Logout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
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
