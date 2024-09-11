import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  print('Plus button pressed');
                },
                child: Image.asset(
                  'assets/icons/plus_button.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  print('Logo button pressed');
                },
                child: Image.asset(
                  'assets/logo.png',
                  width: 34,
                  height: 34,
                ),
              ),

              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello, Michelle!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'see your alerts below',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  print('Account button pressed');
                },
                child: Image.asset(
                  'assets/icons/person_icon.png',
                  width: 19,
                  height: 19,
                ),
              ),
              const SizedBox(width: 13),
              GestureDetector(
                onTap: () {
                  print('Settings button pressed');
                },
                child: Image.asset(
                  'assets/icons/settings.png',
                  width: 17,
                  height: 17,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

