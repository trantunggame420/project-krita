import 'package:flutter/material.dart';
import 'pages/splash_page.dart';

class KritaApp extends StatelessWidget {
  const KritaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creative Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff17181c),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffef7758),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}