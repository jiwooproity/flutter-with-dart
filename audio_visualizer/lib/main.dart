import 'package:flutter/material.dart';

// Core
import 'package:audio_visualizer/core/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Audio Visualizer',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routerConfig: MyRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}