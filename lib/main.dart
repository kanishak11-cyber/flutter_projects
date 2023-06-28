import 'package:flutter/material.dart';
import 'package:flutter_projects/controllers/data_controller.dart';
import 'package:flutter_projects/screens/add_task.dart';
import 'package:flutter_projects/screens/all_tasks.dart';
import 'package:flutter_projects/screens/home_screen.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  loadData() async {
    await Get.find<DataController>().getData();
  }
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'To do',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}




