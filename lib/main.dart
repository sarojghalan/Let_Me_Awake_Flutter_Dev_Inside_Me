
import 'package:awakened_flutter/views/master-plan/plan_screen.dart';
import 'package:awakened_flutter/views/screens/input-form/input_form.dart';
import 'package:awakened_flutter/views/screens/stopwatch/stop_watch_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MasterPlanApp());
}

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home:const PlanScreen(),
    );
  }
}