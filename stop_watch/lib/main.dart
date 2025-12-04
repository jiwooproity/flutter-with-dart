import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stop_watch/stop_watch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: false),
      home: const StopWatchScreen(),
    );
  }
}
