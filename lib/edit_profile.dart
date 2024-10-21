import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _selectedDate = 'Select your Date of Birth';
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                       
                        borderRadius:
                            BorderRadius.circular(12), 
                      ),
                      padding:
                          const EdgeInsets.all(2), 
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: _image == null
                              ? SvgPicture.asset(
                                  'assets/svg_images/cleaning.svg',
                                )
                              : Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                  width: 120,
                                  height: 120,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "John Doe",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "Maintenance Staff",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff7F7F7F),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: _pickImageFromGallery,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xff75865C)),
                            backgroundColor: const Color(0xffFFFFFF),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Change Photo',
                            style: TextStyle(
                              color: Color(0xff75865C),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildLabel('Name'),
              _buildTextField(_nameController, 'Enter your Name'),
              const SizedBox(height: 20),
              _buildLabel('Designation'),
              _buildTextField(_designationController, 'Enter your Designation'),
              const SizedBox(height: 20),
              _buildLabel('Phone Number'),
              _buildTextField(_phoneController, 'Enter your Number'),
              const SizedBox(height: 20),
              _buildLabel('Address'),
              _buildTextField(_addressController, 'Enter your Address'),
              const SizedBox(height: 20),
              _buildLabel('Date of Birth'),
              InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  child: Text(_selectedDate),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton('Cancel', Colors.white, Colors.black, () {}),
                  _buildButton('Update Profile', const Color(0xff75865C),
                      Colors.white, () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xff121417),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildButton(
      String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: textColor),
        ),
      ),
      child: SizedBox(
        width: 150,
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
