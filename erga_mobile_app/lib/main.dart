import 'package:flutter/material.dart';
import 'package:gmail_clone/ui/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gmail Clone',
      theme: ThemeData(
          primaryColor: Colors.white,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
      home: const HomeScreen(),
    );
  }
}
