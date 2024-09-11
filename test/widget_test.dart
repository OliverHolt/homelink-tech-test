import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homelink_responder_app/components/app_header.dart';

void main() {
  testWidgets('Logo button press prints "Logo button pressed"',
      (WidgetTester tester) async {
    final printLogs = <String>[];

    await tester.runAsync(() async {
      await runZonedGuarded(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppHeader(),
            ),
          ),
        );

        await tester.tap(find.byWidgetPredicate((widget) =>
            widget is GestureDetector &&
            widget.child is Image &&
            (widget.child as Image).image is AssetImage &&
            ((widget.child as Image).image as AssetImage).assetName ==
                'assets/logo.png'));

        await tester.pump();
      }, (error, stackTrace) {
        printLogs.add(error.toString());
      }, zoneSpecification: ZoneSpecification(
        print: (self, parent, zone, message) {
          printLogs.add(message);
        },
      ));
    });

    expect(printLogs, contains('Logo button pressed'));
  });
}
