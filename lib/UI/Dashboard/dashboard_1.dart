import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:school_managment_system/UI/Dashboard/Settings/settings.dart';
import 'package:school_managment_system/UI/Dashboard/Students/add_student.dart';
import 'package:school_managment_system/UI/Dashboard/Students/all_students.dart';
import 'package:school_managment_system/UI/Dashboard/Subects/subjects.dart';
import 'package:school_managment_system/UI/Dashboard/charts.dart';
import 'package:school_managment_system/UI/Dashboard/parents/parents.dart';
import 'package:school_managment_system/UI/Dashboard/table_calender.dart';
import 'package:school_managment_system/UI/Dashboard/tearchers/addteacher.dart';
import 'package:school_managment_system/UI/Dashboard/tearchers/allteachers.dart';
import '../../Core/provider/student_provider.dart';
import 'Students/student_promotion.dart';

// int studentsIndex = 0;

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  State<TestingScreen> createState() => _DashboardMainState();
}

class _DashboardMainState extends State<TestingScreen> {
  TextEditingController searchController = TextEditingController();
  int index = 0;
  int accountsIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<StudentProvider>(context, listen: false);
    return Consumer<StudentProvider>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: Constants.purpleDark,
        appBar: AppBar(
          backgroundColor: Constants.purpleLight,
          leadingWidth: MediaQuery.of(context).size.width / 4,
          leading: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Constants.red.withOpacity(0.9),
                  Constants.orange.withOpacity(0.9),
                ],
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: Image(
                        image: AssetImage("assets/dashboard.png"),
                      )),
                  SizedBox(
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: Image(
                        image: AssetImage("assets/dashboard.png"),
                      )),
                ],
              ),
            ),
          ),
          title: SizedBox(
            width: MediaQuery.of(context).size.width / 8,
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: searchController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white),
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          actions: [
            Row(
              children: [
                const Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 150),
                const Icon(
                  Icons.notification_important_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 150),
                CircleAvatar(
                  backgroundImage: Image.network(provider.adminPicUrl).image,
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 150),
              ],
            )
          ],
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Constants.purpleLight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: index == 0
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Constants.red.withOpacity(0.9),
                                    Constants.orange.withOpacity(0.9),
                                  ],
                                ),
                              )
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                      image: AssetImage("assets/dashboard.png"),
                                    )),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                const Text(
                                  "Dashboard",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: index == 1
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Constants.red.withOpacity(0.9),
                                    Constants.orange.withOpacity(0.9),
                                  ],
                                ),
                              )
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                      image: AssetImage("assets/students.png"),
                                    )),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                const Text(
                                  "Students",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    index == 1
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 100),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    provider.changeScreen(0);
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: provider.studentsIndex == 0
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Constants.red.withOpacity(0.9),
                                                Constants.orange
                                                    .withOpacity(0.9),
                                              ],
                                            ),
                                          )
                                        : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  80,
                                            ),
                                            const Text(
                                              "All Students",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.changeScreen(1);
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: provider.studentsIndex == 1
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Constants.red.withOpacity(0.9),
                                                Constants.orange
                                                    .withOpacity(0.9),
                                              ],
                                            ),
                                          )
                                        : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  80,
                                            ),
                                            const Text(
                                              "Add Student",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.changeScreen(2);
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: provider.studentsIndex == 2
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Constants.red.withOpacity(0.9),
                                                Constants.orange
                                                    .withOpacity(0.9),
                                              ],
                                            ),
                                          )
                                        : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  80,
                                            ),
                                            const Text(
                                              "Student promotion",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.transparent,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: index == 2
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Constants.red.withOpacity(0.9),
                                    Constants.orange.withOpacity(0.9),
                                  ],
                                ),
                              )
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                      image: AssetImage("assets/parents.png"),
                                    )),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                const Text(
                                  "Parents",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: index == 3
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Constants.red.withOpacity(0.9),
                                    Constants.orange.withOpacity(0.9),
                                  ],
                                ),
                              )
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                      image: AssetImage("assets/teachers.png"),
                                    )),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                const Text(
                                  "Teachers",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    index == 3
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 100),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(provider.changeTeacherScreen(0));
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: provider.teachersIndex == 0
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Constants.red.withOpacity(0.9),
                                                Constants.orange
                                                    .withOpacity(0.9),
                                              ],
                                            ),
                                          )
                                        : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  80,
                                            ),
                                            const Text(
                                              "All Teachers",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.changeTeacherScreen(1);
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: provider.teachersIndex == 1
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Constants.red.withOpacity(0.9),
                                                Constants.orange
                                                    .withOpacity(0.9),
                                              ],
                                            ),
                                          )
                                        : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  80,
                                            ),
                                            const Text(
                                              "Add Teacher",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 4;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: index == 4
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Constants.red.withOpacity(0.9),
                                    Constants.orange.withOpacity(0.9),
                                  ],
                                ),
                              )
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    width: 30,
                                    height: 23,
                                    child: Image(
                                      image: AssetImage("assets/accounts.png"),
                                    )),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                const Text(
                                  "Accounts",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    index == 4
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 100),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      accountsIndex = 0;
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: accountsIndex == 0
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Constants.red.withOpacity(0.9),
                                                Constants.orange
                                                    .withOpacity(0.9),
                                              ],
                                            ),
                                          )
                                        : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  80,
                                            ),
                                            const Text(
                                              "Fee Group",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      accountsIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: accountsIndex == 1
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Constants.red.withOpacity(0.9),
                                                Constants.orange
                                                    .withOpacity(0.9),
                                              ],
                                            ),
                                          )
                                        : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  80,
                                            ),
                                            const Text(
                                              "Student Fees",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      accountsIndex = 2;
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: accountsIndex == 2
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Constants.red.withOpacity(0.9),
                                                Constants.orange
                                                    .withOpacity(0.9),
                                              ],
                                            ),
                                          )
                                        : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  80,
                                            ),
                                            const Text(
                                              "Expanse",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      accountsIndex = 3;
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: accountsIndex == 3
                                        ? BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                Constants.red.withOpacity(0.9),
                                                Constants.orange
                                                    .withOpacity(0.9),
                                              ],
                                            ),
                                          )
                                        : null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  80,
                                            ),
                                            const Text(
                                              "Add Expanses",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 5;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: index == 5
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Constants.red.withOpacity(0.9),
                                    Constants.orange.withOpacity(0.9),
                                  ],
                                ),
                              )
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                      image: AssetImage("assets/subjects.png"),
                                    )),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                const Text(
                                  "Subjects",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 6;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 18,
                        decoration: index == 6
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Constants.red.withOpacity(0.9),
                                    Constants.orange.withOpacity(0.9),
                                  ],
                                ),
                              )
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                      image: AssetImage("assets/settings.png"),
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                const Text(
                                  "Settings",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: index == 0
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 100,
                        left: MediaQuery.of(context).size.width / 200,
                        bottom: MediaQuery.of(context).size.height / 70,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1,
                        width: MediaQuery.of(context).size.width / 1,
                        color: Constants.purpleDark,
                        child: Row(
                          children: [
                            Expanded(
                                child: SingleChildScrollView(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 1,
                                decoration: const BoxDecoration(
                                  color: Constants.purpleDark,
                                ),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        LineChartSample1(),
                                        TableCollender(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                child: SingleChildScrollView(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 1,
                                width: MediaQuery.of(context).size.width / 1,
                                decoration: const BoxDecoration(
                                  color: Constants.purpleDark,
                                ),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        BarChartSample2(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                child: SingleChildScrollView(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 1,
                                width: MediaQuery.of(context).size.width / 1,
                                decoration: const BoxDecoration(
                                  color: Constants.purpleDark,
                                ),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              90,
                                        ),
                                        PieChartSample2(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    )
                  : index == 1
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 80,
                              left: MediaQuery.of(context).size.width / 150),
                          child: Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 1,
                              width: MediaQuery.of(context).size.width / 1,
                              decoration: const BoxDecoration(
                                color: Constants.purpleLight,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15)),
                              ),
                              child: provider.studentsIndex == 0
                                  ? AllStudents()
                                  : provider.studentsIndex == 1
                                      ? AddStudent()
                                      : provider.studentsIndex == 2
                                          ? StudentPromotion()
                                          : SizedBox(),
                            ),
                          ),
                        )
                      : index == 2
                          ? Parents()
                          : index == 3
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          80,
                                      left: MediaQuery.of(context).size.width /
                                          150),
                                  child: Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1,
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      decoration: const BoxDecoration(
                                        color: Constants.purpleLight,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15)),
                                      ),
                                      child: provider.teachersIndex == 0
                                          ? AllTeachers()
                                          : provider.teachersIndex == 1
                                              ? AddTeacher()
                                              : SizedBox(),
                                    ),
                                  ),
                                )
                              : index == 5
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              80,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              150),
                                      child: Center(
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1,
                                          decoration: const BoxDecoration(
                                            color: Constants.purpleLight,
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(15)),
                                          ),
                                          child: Subjects(),
                                        ),
                                      ),
                                    )
                                  : index == 6
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  80,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  150),
                                          child: Center(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1,
                                              decoration: const BoxDecoration(
                                                color: Constants.purpleLight,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            15)),
                                              ),
                                              child: Settings(),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
