import 'package:flutter/material.dart';
import 'package:todo/screens/addtask.dart';
import 'package:todo/screens/displaytask.dart';
import 'package:todo/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: const Text("To Do"),
      //),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: const TextSpan(
                      text: "Hey There!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: "\n       Have a productive day!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold))
                  ])),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const AddTask(),
                      transition: Transition.fade,
                      duration: const Duration(milliseconds: 25));
                },
                child: const ButtonWidget(
                    bgcolor: Colors.black,
                    text: "Create Task",
                    textColor: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const DisplayTasks(),
                      transition: Transition.fade,
                      duration: const Duration(milliseconds: 25));
                },
                child: const ButtonWidget(
                    bgcolor: Colors.black,
                    text: "View Tasks",
                    textColor: Colors.white),
              )
            ]),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/homepagebackground1.jpg"))),
      ),
    );
  }
}
