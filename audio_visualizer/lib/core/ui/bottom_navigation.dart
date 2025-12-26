import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.title,
    this.isCenter = false,
  });

  final String title;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), centerTitle: isCenter);
  }
}
