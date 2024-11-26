import 'package:flutter/material.dart';
import 'package:kusuma_arts/view/details_view.dart';
import 'package:kusuma_arts/view/home_view.dart';
import 'package:kusuma_arts/view/splash_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(), // Enable dark mode
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/details': (context) => const DetailsScreen(),
      },
    );
  }
}
