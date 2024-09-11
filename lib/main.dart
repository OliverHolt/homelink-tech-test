import 'package:flutter/material.dart';
import 'package:homelink_responder_app/screens/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeLink Responder App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[100]!),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
