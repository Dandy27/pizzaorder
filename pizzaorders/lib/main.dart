import 'package:flutter/material.dart';

import 'pizza_order_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // static const String title = 'Vegan Pizza';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Pizza Order',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PizzaOrderHome(),
    );
  }
}
