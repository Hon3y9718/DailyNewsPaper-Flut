import 'package:dailynewspaper/Screens/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Poppins',
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.red, accentColor: Colors.purple)),
        home: const Home());
  }
}
