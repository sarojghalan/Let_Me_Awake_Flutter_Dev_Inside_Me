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
  bool isTicking = false;
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

  // function to handle start time
  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), _onTick);
    setState(() {
      seconds = 0;
      isTicking = true;
    });
  }

// function to handle stop time
  void _stopTimer() {
    setState(() {
      isTicking = false;
    });
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$seconds ${_secondsText()}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    isTicking ? null : _startTimer();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: const Text('Start'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      isTicking ? _stopTimer() : null;
                    },
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    child: const Text('Stop'))
              ],
            ),
          ],
        ));
  }
}
