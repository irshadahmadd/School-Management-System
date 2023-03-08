import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_managment_system/Core/Utilities/utils.dart';

import 'UI/Dashboard/dashboard_1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController passward = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width / 1,
        height: MediaQuery.of(context).size.height / 1,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
              opacity: .21),
        ),
        // ignore: avoid_unnecessary_containers
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  width: 10, color: Colors.orangeAccent.withOpacity(0.3)),
            ),

            // ignore: prefer_const_literals_to_create_immutables
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 17,
                        child: TextFormField(
                          controller: email,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: "Email",
                            contentPadding: const EdgeInsets.all(10),
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.white),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.red),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 20,
                        child: TextFormField(
                          controller: passward,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Passward",
                            hintStyle: const TextStyle(color: Colors.white),
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.transparent,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.white),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.red),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 7,
                      ),
                      GestureDetector(
                        onTap: () async {
                          auth
                              .createUserWithEmailAndPassword(
                                  email: email.text, password: passward.text)
                              .then((value) => {
                                    Utilities().toastMessage('Updated'),
                                  })
                              .onError((error, stackTrace) => {
                                    Utilities().toastMessage(error.toString()),
                                  });

                          // ignore: use_build_context_synchronously
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TestingScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 15,
                          child: const Center(child: Text("Sign In")),
                        ),
                      )
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
