import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:school_managment_system/Core/provider/student_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance
        .collection("Admin")
        .doc('AdminInformation')
        .snapshots();
    // final DocumentReference ref =
    //     FirebaseFirestore.instance.collection("Admin").doc('AdminInformation');

    return Consumer<StudentProvider>(
      builder: (context, provider, child) => Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Setting",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              Row(
                children: const [
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Icon(
                    Icons.arrow_right_sharp,
                    color: Colors.red,
                    size: 20,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 80,
                      ),
                      const Text(
                        "Admin Account Setting",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 80,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 60),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    provider.adminPicUrl.isEmpty
                                        ? const CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Color.fromARGB(
                                                255, 0, 132, 255),
                                          )
                                        : CircleAvatar(
                                            backgroundImage: Image.network(
                                                    provider.adminPicUrl)
                                                .image,
                                            radius: 50,
                                          ),
                                    StreamBuilder(
                                      stream: firestore,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<DocumentSnapshot>
                                              snapshots) {
                                        if (snapshots.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Text('Loading');
                                        }
                                        if (snapshots.hasError) {
                                          return const Text("Some error occur");
                                        }
                                        // log(snapshots.data!.docs[0]['Language']);
                                        return Text(
                                          snapshots.data!['Username']
                                              .toString(),
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 200, 0),
                                              fontSize: 20),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 50,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Upload Admin Picture",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              50,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            provider.uploadAdminPIc();
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                13,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                20,
                                            decoration: BoxDecoration(
                                                color: Constants.purpleLight,
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.white)),
                                            child: const Center(
                                              child: Text(
                                                "Choose file",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              100,
                                        ),
                                        const Text(
                                          "No file chosen",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 80,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "School Name *",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              const Text(
                                "Email *",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              const Text(
                                "Mobile *",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              const Text(
                                "City *",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              const Text(
                                "Address *",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              const Text(
                                "Username*",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              const Text(
                                "Password *",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              const Text(
                                "Language *",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height / 40,
                                  top: MediaQuery.of(context).size.height / 200,
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                ),
                                child: StreamBuilder(
                                  stream: firestore,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshots) {
                                    if (snapshots.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('Loading');
                                    }
                                    if (snapshots.hasError) {
                                      return const Text("Some error occur");
                                    }
                                    // log(snapshots.data!.docs[0]['Language']);
                                    return Text(
                                      snapshots.data!['Addres'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height / 40,
                                  top: MediaQuery.of(context).size.height / 200,
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: StreamBuilder(
                                  stream: firestore,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshots) {
                                    if (snapshots.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('Loading');
                                    }
                                    if (snapshots.hasError) {
                                      return const Text("Some error occur");
                                    }
                                    // log(snapshots.data!.docs[0]['Language']);
                                    return Text(
                                      snapshots.data!['Email'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height / 40,
                                  top: MediaQuery.of(context).size.height / 200,
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: StreamBuilder(
                                  stream: firestore,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshots) {
                                    if (snapshots.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('Loading');
                                    }
                                    if (snapshots.hasError) {
                                      return const Text("Some error occur");
                                    }
                                    // log(snapshots.data!.docs[0]['Language']);
                                    return Text(
                                      snapshots.data!['MobileNo'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height / 40,
                                  top: MediaQuery.of(context).size.height / 200,
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: StreamBuilder(
                                  stream: firestore,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshots) {
                                    if (snapshots.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('Loading');
                                    }
                                    if (snapshots.hasError) {
                                      return const Text("Some error occur");
                                    }
                                    // log(snapshots.data!.docs[0]['Language']);
                                    return Text(
                                      snapshots.data!['City'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height / 40,
                                  top: MediaQuery.of(context).size.height / 200,
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: StreamBuilder(
                                  stream: firestore,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshots) {
                                    if (snapshots.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('Loading');
                                    }
                                    if (snapshots.hasError) {
                                      return const Text("Some error occur");
                                    }
                                    // log(snapshots.data!.docs[0]['Language']);
                                    return Text(
                                      snapshots.data!['Addres'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height / 40,
                                  top: MediaQuery.of(context).size.height / 200,
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: StreamBuilder(
                                  stream: firestore,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshots) {
                                    if (snapshots.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('Loading');
                                    }
                                    if (snapshots.hasError) {
                                      return const Text("Some error occur");
                                    }
                                    // log(snapshots.data!.docs[0]['Language']);
                                    return Text(
                                      snapshots.data!['Username'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height / 40,
                                  top: MediaQuery.of(context).size.height / 200,
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: StreamBuilder(
                                  stream: firestore,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshots) {
                                    if (snapshots.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('Loading');
                                    }
                                    if (snapshots.hasError) {
                                      return const Text("Some error occur");
                                    }
                                    // log(snapshots.data!.docs[0]['Language']);
                                    return Text(
                                      snapshots.data!['Password'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height / 40,
                                  top: MediaQuery.of(context).size.height / 200,
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: StreamBuilder(
                                  stream: firestore,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshots) {
                                    if (snapshots.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('Loading');
                                    }
                                    if (snapshots.hasError) {
                                      return const Text("Some error occur");
                                    }
                                    // log(snapshots.data!.docs[0]['Language']);
                                    return Text(
                                      snapshots.data!['Language'].toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
