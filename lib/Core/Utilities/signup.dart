import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:school_managment_system/Core/Models/app_user_model.dart';
import 'package:school_managment_system/Core/Utilities/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey formkey = GlobalKey<FormState>();
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
                                  fit: BoxFit.cover))),
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
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  child: TextFormField(
                                    controller: schoolName,
                                    decoration: kTtextfieldDecoration.copyWith(
                                        hintText: "School ",
                                        suffixIcon: const Icon(
                                          Icons.school,
                                          color: Colors.white,
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.white)),
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.height / 18,
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: address,
                                  decoration: kTtextfieldDecoration.copyWith(
                                      hintText: "Address",
                                      suffixIcon: const Icon(
                                        Icons.location_city,
                                        color: Colors.white,
                                      ),
                                      hintStyle:
                                          const TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  child: TextFormField(
                                    controller: city,
                                    decoration: kTtextfieldDecoration.copyWith(
                                        hintText: "City ",
                                        suffixIcon: const Icon(
                                          Icons.location_city,
                                          color: Colors.white,
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.white)),
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.height / 18,
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: email,
                                  decoration: kTtextfieldDecoration.copyWith(
                                      hintText: "Email",
                                      suffixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ),
                                      hintStyle:
                                          const TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  child: TextFormField(
                                    controller: mobileNo,
                                    decoration: kTtextfieldDecoration.copyWith(
                                        hintText: "Mobile ",
                                        suffixIcon: const Icon(
                                          Icons.phone,
                                          color: Colors.white,
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.white)),
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.height / 18,
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: username,
                                  decoration: kTtextfieldDecoration.copyWith(
                                      hintText: "UserName",
                                      suffixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                      hintStyle:
                                          const TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  child: TextFormField(
                                    controller: passward,
                                    decoration: kTtextfieldDecoration.copyWith(
                                        hintText: "Password ",
                                        suffixIcon: const Icon(
                                          Icons.lock,
                                          color: Colors.white,
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.white)),
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.height / 18,
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: language,
                                  decoration: kTtextfieldDecoration.copyWith(
                                      suffixIcon: const Icon(
                                        Icons.language,
                                        color: Colors.white,
                                      ),
                                      hintText: "Language",
                                      hintStyle:
                                          const TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 13,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("ajksdjk=======akjsdkajs===");
                          appUserModel.schoolName = schoolName.text;
                          appUserModel.addres = address.text;
                          appUserModel.city = city.text;
                          appUserModel.email = email.text;
                          appUserModel.mobileNo = mobileNo.text;
                          appUserModel.username = username.text;
                          appUserModel.password = passward.text;
                          appUserModel.language = language.text;
                          firestore
                              .collection("Admin")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set(appUserModel.toJson())
                              .then((value) => {
                                    auth.createUserWithEmailAndPassword(
                                        email: email.text,
                                        password: passward.text),
                                    Utilities().toastMessage(
                                        "Your Admin Account has been created"),
                                  })
                              .onError((error, stackTrace) => {});
                        },
                        child: Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 13,
                            width: MediaQuery.of(context).size.width / 3.5,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 128, 11, 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                                child: Text(
                              "Sign Up",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an Admin account then",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 248, 227, 227),
                                  fontSize: 15),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 100),
                            const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 160, 9, 9),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              Container(),
            ],
          )),
    );
  }
}
