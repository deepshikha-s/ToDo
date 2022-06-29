import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/addtask.dart';
import 'package:todo/screens/homepage.dart';
import 'package:todo/widgets/button_widget.dart';
import 'package:todo/widgets/task_widget.dart';

class DisplayTasks extends StatelessWidget {
  const DisplayTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData = [
      "Test task 1",
      "Test task 2",
      "Test task 3",
    ];
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/backgroundaddtask.jpg"))),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const HomePage(),
                        transition: Transition.fade,
                        duration: const Duration(milliseconds: 25));
                  },
                  child: const Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => const AddTask(),
                          transition: Transition.zoom,
                          duration: const Duration(milliseconds: 25));
                    },
                    child: const Icon(
                      Icons.add_task,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                const Icon(
                  Icons.add_alert,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "2",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: rightDeleteIcon,
                    onDismissed: (DismissDirection direction) {},
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Container(
                                height: 550,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent.withOpacity(0.7),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    )),
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      ButtonWidget(
                                          bgcolor: Colors.black,
                                          text: "View",
                                          textColor: Colors.white),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ButtonWidget(
                                          bgcolor: Colors.black,
                                          text: "Edit",
                                          textColor: Colors.white),
                                    ]),
                              );
                            });
                        return false;
                      } else {
                        return Future.delayed(const Duration(seconds: 1),
                            () => direction == DismissDirection.endToStart);
                      }
                    },
                    key: ObjectKey(index),
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child:
                          TaskWidget(text: myData[index], color: Colors.black),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
