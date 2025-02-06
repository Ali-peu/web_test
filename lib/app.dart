import 'package:flutter/material.dart';
import 'package:web_test/ui/order_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          textTheme: TextTheme(
        displayMedium: TextStyle(color: Colors.black, fontSize: 20),
        bodySmall: TextStyle(color: Colors.white, fontSize: 15),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 17),
        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(color: Colors.white, fontSize: 18),
      )),
      home: OrderScreen(),
    );
  }
}
