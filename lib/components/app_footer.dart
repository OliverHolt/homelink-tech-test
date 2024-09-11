import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 43),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print('Live view');
            },
            child: Image.asset(
              'assets/icons/live_icon.png',
              width: 50,
              height: 28,
            ),
          ),
          const SizedBox(width: 36),
          GestureDetector(
            onTap: () {
              print('Summary view');
            },
            child: Image.asset(
              'assets/icons/summary_icon.png',
              width: 50,
              height: 29,
            ),
          ),
        ],
      ),
    );
  }
}
