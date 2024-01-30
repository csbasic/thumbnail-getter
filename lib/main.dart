import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thumbnail_getter/home_screen.dart';

void main() {
  runApp(const Mp4Detector());
}

class Mp4Detector extends StatelessWidget {
  const Mp4Detector({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MP4 Getter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
