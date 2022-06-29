import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
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
                const Icon(
                  Icons.home,
                  color: Colors.blue,
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
                  child: const Icon(
                    Icons.add_task,
                    color: Colors.blue,
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
                  return Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: TaskWidget(text: myData[index], color: Colors.black),
                  );
                }),
          )
        ],
      ),
    );
  }
}
