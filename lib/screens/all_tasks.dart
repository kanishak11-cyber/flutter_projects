// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/colors/app_colors.dart';
import 'package:get/get.dart';
import '../widgets/button_widget.dart';
import '../widgets/task_widger.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = ["Try harder", "Try Smarter"];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
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
                  const SizedBox(height: 60,),
              InkWell(
                onTap: () {
                  Get.back();
                },
                // child: SizedBox(height: 20,),
                child: Icon(
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
                  background: leftEditIcon,
                  secondaryBackground: rightDeleteIcon,
                  onDismissed: (DismissDirection direction){
                    print("after dismiss");
                  },
                  confirmDismiss: (DismissDirection direction) async{
                    if(direction == DismissDirection.startToEnd){
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (_){
                            return Container(
                              height: 500,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2e3253).withOpacity(.4),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: const Padding(

                                padding: EdgeInsets.only(left: 20, right: 20,),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ButtonWidget(backgroundColor: AppColors.mainColor, text:"view",textColor: Colors.white, ),
                                    SizedBox(height: 20,),
                                    ButtonWidget(backgroundColor: AppColors.mainColor, text:"Edit",textColor: Colors.white, ),
                                  ],
                                ),
                              ),
                            );
                          },);
                      return false;
                    }else{

                      return Future.delayed(const Duration(seconds: 1),() =>
                        direction==DismissDirection.endToStart
                      );
                    }

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
