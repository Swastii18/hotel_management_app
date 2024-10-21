import 'package:flutter/material.dart';

class LeaveRequestComponent extends StatelessWidget {
  const LeaveRequestComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: Row(
        children: [
          const Text(
            "Request for Leave",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff232323),
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => LeaveRequestForm(),
              //   ),
              // );
            },
            child: const CircleAvatar(
              backgroundColor: Color(0xff75865C),
              radius: 10,
              child: Text(
                "+",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
