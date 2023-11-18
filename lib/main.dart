import 'package:flutter/material.dart';
import 'package:untitled2/features/home/presentation/view/home_await_screen.dart';
import 'package:untitled2/features/home/presentation/view/home_view.dart';
import 'injection_container.dart' as di;

void main() async{
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}