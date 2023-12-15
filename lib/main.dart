
import 'package:awakened_flutter/views/screens/input-form/input_form.dart';
import 'package:awakened_flutter/views/screens/stopwatch/stop_watch_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputForm()
    );
  }
}
