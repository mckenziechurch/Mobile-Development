import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget { // create the Stopwatch widget object as a Stateful widget
 const StopWatch({super.key});
 
 @override
 State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> { // create the Stopwatch widget's state object 
  int seconds = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer time) {
    setState(() {
      ++seconds;
    });
  }
  @override
  Widget build(BuildContext context) { // after state is declared, the widget will build
    String _secondsText() => seconds == 1 ? 'second' : 'seconds';
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Text(
          '$seconds ${_secondsText()}',
          style: Theme.of(context).textTheme.headline5,
        ), 
        ),
      );
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
}
}