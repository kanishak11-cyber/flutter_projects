// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/colors/app_colors.dart';
import 'package:flutter_projects/screens/add_task.dart';
import 'package:flutter_projects/screens/all_tasks.dart';
import 'package:flutter_projects/widgets/button_widget.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/welcome.jpg"))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Hello ",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 60,
                      fontWeight: FontWeight.bold
                    ),
                    children: [
                      TextSpan(
                          text: "\nStart Your beautiful day  ",
                          style: TextStyle(
                              color: AppColors.smallTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.normal
                          )
                      )
                    ]
                  )
                ),
                SizedBox(height: MediaQuery.of(context).size.height/2.5,),
                InkWell(
                  onTap: (){
                    Get.to(()=> const AddTask(),transition: Transition.fade, duration: const Duration(seconds: 1),);
                  },
                  child: const ButtonWidget(
                      backgroundColor: AppColors.mainColor,
                      text: "Add task",
                      textColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20,),

                InkWell(
                  onTap: (){
                    Get.to(()=>const AllTasks(),transition: Transition.fadeIn,duration: const Duration(seconds: 1));
                  },
                  child: const ButtonWidget(
                    backgroundColor: Colors.white,
                    text: "View All",
                    textColor: AppColors.smallTextColor ,
                  ),
                ),
        ],
      ),
    ));
  }
}
