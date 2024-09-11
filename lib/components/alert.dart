import 'package:flutter/material.dart';
import 'package:homelink_responder_app/models/alert_details.dart';
import 'package:homelink_responder_app/models/alert_details_info_display.dart';
import 'package:homelink_responder_app/utils/ui_utils.dart';
import 'package:video_player/video_player.dart';

class Alert extends StatefulWidget {
  final bool showAlert;
  final bool expandAlert;
  final double boxWidth;
  final double centerX;
  final AlertDetails alertDetails;

  const Alert({
    super.key,
    required this.showAlert,
    required this.expandAlert,
    required this.boxWidth,
    required this.centerX,
    required this.alertDetails,
  });

  @override
  AlertState createState() => AlertState();
}

class AlertState extends State<Alert> {
  bool showThankYouMessage = false;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(
      'assets/homelink_tick.mp4',
    )..initialize().then((_) {
        setState(() {
          _videoController.setLooping(false);
        });
      }).catchError((error) {
        print("Error initializing video: $error");
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      right: widget.showAlert ? widget.centerX : -1500,
      top: 75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.8),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: widget.boxWidth,
          height: widget.expandAlert ? 476 : 137,
          color: Colors.white,
          curve: Curves.easeInOut,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: showThankYouMessage
                      ? Color(0xFF488333)
                      : Color(0xFFF24D72),
                  width: 1,
                ),
                right: BorderSide(
                  color: showThankYouMessage
                      ? Color(0xFF488333)
                      : Color(0xFFF24D72),
                  width: 1,
                ),
                bottom: BorderSide(
                  color: showThankYouMessage
                      ? Color(0xFF488333)
                      : Color(0xFFF24D72),
                  width: 1,
                ),
                left: BorderSide(
                  color: showThankYouMessage
                      ? Color(0xFF488333)
                      : Color(0xFFF24D72),
                  width: 11,
                ),
              ),
              borderRadius: BorderRadius.circular(8.8),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 750),
              child: showThankYouMessage
                  ? _buildThankYouMessage()
                  : _buildAlertContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlertContent() {
    return SingleChildScrollView(
      key: const ValueKey('alertContent'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          children: [
            AlertDetailsInfoDisplay(alertDetails: widget.alertDetails),
            const SizedBox(height: 50),
            Column(
              children: [
                actionButton('Everything\'s OK', () {
                  setState(() {
                    showThankYouMessage = true;
                  });
                  Future.delayed(const Duration(seconds: 1), () {
                    if (_videoController.value.isInitialized) {
                      _videoController.play();
                    }
                  });
                }),
                const SizedBox(height: 20),
                actionButton('Going to property now', () {
                  print('Going to property now');
                }),
                const SizedBox(height: 20),
                actionButton('Call Doctor', () {
                  print('Call Doctor');
                }),
                const SizedBox(height: 20),
                actionButton('I cannot visit', () {
                  print('I cannot visit');
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThankYouMessage() {
    return Container(
      key: const ValueKey('thankYouMessage'),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFDEE3EF), width: 2),
              ),
            ),
            child: const Text(
              'Resolved',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFFAAB5CF),
                fontFamily: 'Inter',
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 60, left: 50, right: 0),
              child:
                  AlertDetailsInfoDisplay(alertDetails: widget.alertDetails)),
          const Text(
            'Thank you for your update!',
            style: TextStyle(
              color: Color(0xFF4083B9),
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _videoController.value.isInitialized
              ? SizedBox(
                  width: 78,
                  height: 78,
                  child: ClipOval(
                    child: Transform.scale(
                      scale: 1.2,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController.value.size.width,
                          height: _videoController.value.size.height,
                          child: VideoPlayer(_videoController),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(
                  width: 78,
                  height: 78,
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
