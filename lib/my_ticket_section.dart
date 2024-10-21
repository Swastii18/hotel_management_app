import 'package:flutter/material.dart';

class MyTicketSection extends StatelessWidget {
  final String status;
  final String recordedAt;
  final String request;
  final String leavePeriod;

  const MyTicketSection({
    super.key,
    required this.status,
    required this.recordedAt,
    required this.request,
    required this.leavePeriod,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        color: status == "Approved"
                            ? const Color(0xff75865C)
                            : const Color(0xffFF6F61),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(recordedAt,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff787878))),
                  ],
                ),
                Text(request,
                    style: const TextStyle(
                        color: Color(0xff1A1A1A),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                Text(
                  leavePeriod,
                  style: const TextStyle(
                      color: Color(0xff1A1A1A),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
      ),
    );
  }
}
