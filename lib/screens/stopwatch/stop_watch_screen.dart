import 'package:flutter/material.dart';
// providing asynchronous utilities like Timer
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});


  // returning instance of _StopWatchState when created
  @override
  State<StopWatch> createState() => _StopWatchState();
}


// it is the state associated with StopWatch widget
class _StopWatchState extends State<StopWatch> {
  int seconds = 0;
  late Timer timer;

  // defining single line function
  // in Dart we use arrow syntax or fat arrow syntax
  // to define a single line function
  String _secondsText() => seconds == 1 ? 'second' : 'seconds';

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _onTick(Timer time) {
    if (mounted) {
      setState(() {
        ++seconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'State Ful Widgets',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '$seconds ${_secondsText()}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
