import 'package:flutter/material.dart';
import 'package:web_test/ui/order_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          textTheme: TextTheme(
        displayMedium: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w800),
        bodySmall: TextStyle(color: Colors.white, fontSize: 10),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 11),
        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(color: Colors.white, fontSize: 14),
      )),
      home: OrderScreen(),
    );
  }
}
