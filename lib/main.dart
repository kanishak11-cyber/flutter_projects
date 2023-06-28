import 'package:flutter/material.dart';
import 'package:flutter_projects/screens/add_task.dart';
import 'package:flutter_projects/screens/all_tasks.dart';
import 'package:flutter_projects/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'To do',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // useMaterial3: true,
      ),
      home: const AllTasks(),
    );
  }
}




