import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/colors/app_colors.dart';

import '../widgets/task_widger.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = ["Try harder", "Try Smarter"];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              alignment: Alignment.topLeft,
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 3.2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/header1.jpg"),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              )),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color: Colors.black),
                ),
                Expanded(
                  child: Container(),
                ),
                const Icon(
                  Icons.calendar_month_sharp,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "2",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryColor,
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(itemCount: myData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction){
                    print("after dismiss");
                  },
                  confirmDismiss: (DismissDirection direction) async{
                    print(" confirm");
                    return false;
                  },
                  key: ObjectKey(index),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: TaskWidget(
                      text: myData[index],
                      color: Colors.blueGrey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
