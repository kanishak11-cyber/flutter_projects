import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/colors/app_colors.dart';
import 'package:flutter_projects/widgets/button_widget.dart';

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
                const ButtonWidget(
                    backgroundColor: AppColors.mainColor,
                    text: "Add task",
                    textColor: Colors.white,
                ),
                SizedBox(height: 20,),

                const ButtonWidget(
                  backgroundColor: Colors.white,
                  text: "View All",
                  textColor: AppColors.smallTextColor ,
                ),
        ],
      ),
    ));
  }
}
