import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/homepage.dart';
import 'package:todo/widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      text: "Welcome!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: "\n       Start organising to be productive!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold))
                  ])),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              const ButtonWidget(
                  bgcolor: Colors.black,
                  text: "Register",
                  textColor: Colors.white),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const HomePage(),
                      transition: Transition.fade,
                      duration: const Duration(seconds: 1));
                },
                child: const ButtonWidget(
                    bgcolor: Colors.black,
                    text: "Login",
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
