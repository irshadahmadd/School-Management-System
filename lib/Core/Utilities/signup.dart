import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:school_managment_system/Core/Models/app_user_model.dart';
import 'package:school_managment_system/Core/Utilities/login.dart';
import 'package:school_managment_system/Core/Utilities/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController schoolName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController passward = TextEditingController();
  TextEditingController language = TextEditingController();
  AppUserModel appUserModel = AppUserModel();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width / 1,
        height: MediaQuery.of(context).size.height / 1,
        decoration: const BoxDecoration(
          color: Constants.purpleDark,
          image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
              opacity: 0.1),
        ),
        // ignore: avoid_unnecessary_containers
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width / 2,
              color: Constants.purpleDark,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/weblogo.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Roboto',
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 0.5,
                              color: Color.fromARGB(122, 255, 255, 255),
                            ),
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 0.5,
                              color: Color.fromARGB(121, 144, 156, 117),
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText('Create Admin Account'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 13,
                  ),
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: schoolName,
                                decoration: kTtextfieldDecoration.copyWith(
                                  hintText: "School ",
                                  suffixIcon: const Icon(
                                    Icons.school,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  hintStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter School';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: address,
                                decoration: kTtextfieldDecoration.copyWith(
                                  hintText: "Address",
                                  suffixIcon: const Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  hintStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: city,
                                decoration: kTtextfieldDecoration.copyWith(
                                  hintText: "City ",
                                  suffixIcon: const Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  hintStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter City';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: email,
                                decoration: kTtextfieldDecoration.copyWith(
                                  hintText: "Email",
                                  suffixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  hintStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: mobileNo,
                                decoration: kTtextfieldDecoration.copyWith(
                                  hintText: "Mobile ",
                                  suffixIcon: const Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  hintStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter phone';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: username,
                                decoration: kTtextfieldDecoration.copyWith(
                                  hintText: "UserName",
                                  suffixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  hintStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Username';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: passward,
                                decoration: kTtextfieldDecoration.copyWith(
                                    hintText: "Password ",
                                    suffixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    hintStyle:
                                        const TextStyle(color: Colors.white)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: language,
                                decoration: kTtextfieldDecoration.copyWith(
                                  suffixIcon: const Icon(
                                    Icons.language,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  hintText: "Language",
                                  hintStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Lang';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 13,
                  ),
                  InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        appUserModel.schoolName = schoolName.text;
                        appUserModel.addres = address.text;
                        appUserModel.city = city.text;
                        appUserModel.email = email.text;
                        appUserModel.mobileNo = mobileNo.text;
                        appUserModel.username = username.text;
                        appUserModel.password = passward.text;
                        appUserModel.language = language.text;
                        await firestore
                            .collection("Admin")
                            .doc("AdminInformation")
                            .set(appUserModel.toJson())
                            .then(
                              (value) => {
                                auth.createUserWithEmailAndPassword(
                                    email: email.text, password: passward.text),
                                Utilities().toastMessage("Admin Registered"),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                )
                              },
                            )
                            .onError(
                              (error, stackTrace) => {
                                Utilities().toastMessage(error.toString()),
                              },
                            );
                      } else {
                        return;
                      }
                    },
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  DefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Roboto',
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 0.5,
                            color: Color.fromARGB(122, 255, 255, 255),
                          ),
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 0.5,
                            color: Color.fromARGB(255, 10, 77, 0),
                          ),
                        ],
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 255, 94)),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                            'Already have an Admin\n  Account then Sign in'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 4, 121, 39),
                    radius: 50,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 2, 98, 0),
                      backgroundImage: AssetImage(
                        "assets/adminpng.jpeg",
                      ),
                      radius: 45,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  const Text(
                    "Admin",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  const Text(
                    "Sign in to the website by using your admin account.",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 5, 125, 69),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
