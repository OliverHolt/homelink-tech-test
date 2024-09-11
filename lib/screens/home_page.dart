import 'package:flutter/material.dart';
import 'package:homelink_responder_app/components/alert.dart';
import 'package:homelink_responder_app/components/app_footer.dart';
import 'package:homelink_responder_app/components/app_header.dart';
import 'package:homelink_responder_app/models/alert_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _showAlert = false;
  bool _expandAlert = false;
  final _alertDetails = AlertDetails(
    time: 'Now',
    alertType: 'SOS pendant activation',
    address: '24 Lema Lane, BS1 8MN',
    customer: 'John Corn',
    image: 'assets/alert_with_resident.png',
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showAlert = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _expandAlert = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxWidth = MediaQuery.of(context).size.width * 0.9;
    final centerX = (screenWidth - boxWidth) / 2;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(209, 226, 247, 1),
                    Color.fromRGBO(255, 255, 255, 1),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const AppHeader(),
                Expanded(
                  child: Stack(
                    children: [
                      Alert(
                        showAlert: _showAlert,
                        expandAlert: _expandAlert,
                        boxWidth: boxWidth,
                        centerX: centerX,
                        alertDetails: _alertDetails,
                      ),
                    ],
                  ),
                ),
                const AppFooter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
