import 'package:flutter/material.dart';
import 'package:homelink_responder_app/models/alert_details.dart';

class AlertDetailsInfoDisplay extends StatelessWidget {
  final AlertDetails alertDetails;

  const AlertDetailsInfoDisplay({super.key, required this.alertDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                alertDetails.time,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3A3A3A),
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              alertDetails.image,
              width: 45,
              height: 45,
            ),
          ],
        ),
        const SizedBox(width: 17),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              alertDetails.alertType,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFFE90033),
                fontFamily: 'Montserrat',
              ),
              textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: false,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'at ${alertDetails.address}\nby ${alertDetails.customer}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF3A3A3A),
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
