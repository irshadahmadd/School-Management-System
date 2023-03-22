import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

    return Padding(
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
                      "Account Setting",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(""),
                      radius: 50,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text(
                              "School Name *",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              "Email *",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              "Mobile *",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              "City *",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            const Text(
                              "Address *",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              "Username*",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            const Text(
                              "Password *",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              "Language *",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Column(
                          children: [
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
                                    AsyncSnapshot<DocumentSnapshot> snapshots) {
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
                                    style: const TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
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
                                    AsyncSnapshot<DocumentSnapshot> snapshots) {
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
                                    style: const TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
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
                                    AsyncSnapshot<DocumentSnapshot> snapshots) {
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
                                    style: const TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
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
                                    AsyncSnapshot<DocumentSnapshot> snapshots) {
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
                                    style: const TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
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
                                    AsyncSnapshot<DocumentSnapshot> snapshots) {
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
                                    style: const TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
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
                                    AsyncSnapshot<DocumentSnapshot> snapshots) {
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
                                    style: const TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
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
                                    AsyncSnapshot<DocumentSnapshot> snapshots) {
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
                                    style: const TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
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
                                    AsyncSnapshot<DocumentSnapshot> snapshots) {
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
                                    style: const TextStyle(color: Colors.white),
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
    );
  }
}
