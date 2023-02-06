import 'package:flutter/material.dart';
import './stopwatch/stopwatch_widget.dart';

void main() {
  runApp(StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StopwatchApp(),
    );
  }
}
