import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'edit_profile.dart';
import 'log_out_confirmation.dart';
import 'notification_page.dart';
import 'password&privacy.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        title: const Text("Settings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        backgroundColor: const Color(0xffFAFAFA),
      ),
      body: Container(
        color: const Color(0xffFAFAFA),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: SvgPicture.asset(
                          'assets/svg_images/cleaning.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "John Doe",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Text("Maintenance Staff",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff7F7F7F))),
                    const Text("9800000000",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff7F7F7F))),
                  ],
                ),
              ),
              const Divider(),
              _buildSettingsSection('Account', [
                _buildSvgOption(context, 'assets/svg_images/editprofile.svg',
                    'Edit profile', const EditProfile()),
                _buildSvgOption(context, 'assets/svg_images/security.svg',
                    'Security', null),
                _buildSvgOption(
                    context,
                    'assets/svg_images/notificationbell.svg',
                    'Notifications',
                    NotificationPage()),
                _buildSvgOption(context, 'assets/svg_images/privacy.svg',
                    'Privacy', const PasswordChange()),
              ]),
              _buildSettingsSection('Support & About', [
                _buildSvgOption(context, 'assets/svg_images/myworkstat.svg',
                    'My Work Statistics', null),
                _buildSvgOption(context, 'assets/svg_images/help&support.svg',
                    'Help & Support', null),
                _buildSvgOption(context, 'assets/svg_images/terms&policy.svg',
                    'Terms and Policies', null),
              ]),
              _buildSettingsSection('Actions', [
                _buildSvgOption(context, 'assets/svg_images/reportaproblem.svg',
                    'Report a problem', null),
                _buildSvgOption(context, 'assets/svg_images/logout.svg',
                    'Log out', const LogOutConfirmation()),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSvgOption(
      BuildContext context, String svgPath, String title, Widget? navigateTo) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffF2F2F2),
        ),
        child: ListTile(
          leading: SvgPicture.asset(
            svgPath,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          onTap: () {
            if (navigateTo != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => navigateTo),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        ...options,
        const SizedBox(height: 8),
      ],
    );
  }
}
