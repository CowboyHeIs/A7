import 'package:flutter/material.dart';
import 'package:bi/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // Black background
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF3E1A78), // Darker purple for AppBar
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Color(0xFF3E1A78)), // Dark purple
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
