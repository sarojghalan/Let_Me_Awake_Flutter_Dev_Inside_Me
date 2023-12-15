import 'package:awakened_flutter/views/widgets/modal/platform_alert.dart';
import 'package:flutter/material.dart';
// providing asynchronous utilities like Timer
import 'dart:async';

class StopWatch extends StatefulWidget {
  final String name;
  final String email;
  const StopWatch({super.key, required this.name, required this.email});

  // returning instance of _StopWatchState when created
  @override
  State<StopWatch> createState() => _StopWatchState();
}

// it is the state associated with StopWatch widget
class _StopWatchState extends State<StopWatch> {
  bool isTicking = false;
  int milliseconds = 0;
  final laps = <int>[];
  late Timer timer;
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  // defining single line function
  // in Dart we use arrow syntax or fat arrow syntax
  // to define a single line function
  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  // function to handle start time
  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
    setState(() {
      milliseconds = 0;
      isTicking = true;
      laps.clear();
    });
  }

// function to handle stop time
  void _stopTimer() {
    setState(() {
      isTicking = false;
    });
    final totalRunTime = laps.fold(milliseconds, (total, lap) => total + lap);
    final alert = PlatFormAlert(
      title: 'Run Completed!',
      message: 'Total Run Time is ${_secondsText(totalRunTime)}.',
    );
    alert.show(context);
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });

    scrollController.animateTo(itemHeight * laps.length,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void _onTick(Timer time) {
    if (mounted) {
      setState(() {
        milliseconds += 100;
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name,
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: _buildContainer(context));
  }

  Container _buildContainer(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
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
                width: 20,
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
                  child: const Text('Stop')),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow)),
                  onPressed: isTicking ? _lap : null,
                  child: const Text('Lap'))
            ],
          ),
          Expanded(
              child: Scrollbar(
            controller: scrollController,
            child: ListView.builder(
              controller: scrollController,
              itemExtent: itemHeight,
              itemCount: laps.length,
              itemBuilder: (context, index) {
                final milliseconds = laps[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                  title: Text('Lap ${index + 1}'),
                  trailing: Text(_secondsText(milliseconds)),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
