import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class EmptyPage extends StatelessWidget {
  final String title;
  const EmptyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title, style: const TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
