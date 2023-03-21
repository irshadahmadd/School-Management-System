import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:school_managment_system/Core/provider/student_provider.dart';

class AllTeachers extends StatefulWidget {
  const AllTeachers({super.key});

  @override
  State<AllTeachers> createState() => _AllTeachersState();
}

class _AllTeachersState extends State<AllTeachers> {
  TextEditingController sbyNameContoller = TextEditingController();
  TextEditingController sbyClassContoller = TextEditingController();
  TextEditingController searchController = TextEditingController();
  final firestore =
      FirebaseFirestore.instance.collection("Teachers").snapshots();

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<StudentProvider>(context, listen: true);
    return Consumer<StudentProvider>(
      builder: (context, provider, child) => Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Teachers",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              Row(
                children: const [
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.red),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12,
                    color: Colors.red,
                  ),
                  Text(
                    "Teachers",
                    style: TextStyle(color: Colors.white),
                  )
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
                        const Text(
                          "All Teachers Data",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Constants.purpleLight),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: sbyNameContoller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: "Search by Name",
                                  hintStyle: TextStyle(color: Colors.white),
                                  // filled: true,
                                  // fillColor: Colors.white,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Constants.purpleLight),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: sbyClassContoller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: "Search by Class",
                                  hintStyle: TextStyle(color: Colors.white),
                                  // filled: true,
                                  // fillColor: Colors.white,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 10,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Constants.red),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: searchController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: Colors.white),
                                  // filled: true,
                                  // fillColor: Colors.white,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.all(color: Colors.white),
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 180,
                                  top: MediaQuery.of(context).size.width / 150,
                                  bottom:
                                      MediaQuery.of(context).size.width / 150,
                                ),
                                child: const Text(
                                  "ID",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        180),
                                child: const Text(
                                  "Frist Name",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        180),
                                child: const Text(
                                  "Gender",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        180),
                                child: const Text(
                                  "DOB",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        180),
                                child: const Text(
                                  "Address",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        180),
                                child: const Text(
                                  "Subject",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  "Phone",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2.3,
                          width: MediaQuery.of(context).size.width / 1,
                          child: StreamBuilder<QuerySnapshot>(
                              stream: firestore,
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshots) {
                                if (snapshots.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Text("");
                                }
                                if (snapshots.hasError) {
                                  return const Text("Some error occur");
                                }
                                return ListView.builder(
                                    itemCount: snapshots.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      return Table(
                                        defaultVerticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        border: TableBorder.symmetric(
                                            outside: const BorderSide(
                                                width: 1, color: Colors.white)),
                                        children: [
                                          TableRow(children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    180,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    150,
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    150,
                                              ),
                                              child: Text(
                                                snapshots.data!
                                                    .docs[index]["teacherID"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      180),
                                              child: Text(
                                                snapshots
                                                    .data!.docs[index]["tfname"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      180),
                                              child: Text(
                                                snapshots
                                                    .data!.docs[index]["tDOB"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      180),
                                              child: Text(
                                                snapshots.data!
                                                    .docs[index]["taddress"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      180),
                                              child: Text(
                                                snapshots.data!
                                                    .docs[index]["tsubject"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      180),
                                              child: Text(
                                                snapshots.data!
                                                    .docs[index]["tjoiningdate"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      180),
                                              child: Text(
                                                snapshots
                                                    .data!.docs[index]["tphone"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ]),
                                        ],
                                      );
                                    });
                              }),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
