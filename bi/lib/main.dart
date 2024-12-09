import 'package:flutter/material.dart';
import 'package:bi/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: const Color(0xFF1E0028), // Darker shade of purple
          secondary: const Color(0xFF1E0028),
          surface: const Color(0xFF1E0028),
          background: const Color(0xFF1E0028),
          error: Colors.red,
          onPrimary: Colors.orange,
          onSecondary: Colors.orange,
          onSurface: Colors.orange,
          onBackground: Colors.orange,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF1E0028),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1E0028),
          foregroundColor: Colors.orange,
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
