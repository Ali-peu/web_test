import 'package:flutter/material.dart';

class AppAdCard extends StatelessWidget {
  final Widget child;
  const AppAdCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.28,
            child: child));
  }
}
