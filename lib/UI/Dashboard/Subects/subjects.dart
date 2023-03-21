import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:school_managment_system/Core/Models/subjects_mode.dart';
import 'package:school_managment_system/Core/Utilities/utils.dart';
import 'package:school_managment_system/Core/provider/student_provider.dart';
import 'package:school_managment_system/UI/Dashboard/Students/add_student.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  TextEditingController sbyNameContoller = TextEditingController();
  TextEditingController sbyClassContoller = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController subjectName = TextEditingController();
  TextEditingController teacher = TextEditingController();
  TextEditingController classes = TextEditingController();
  TextEditingController dayes = TextEditingController();
  SubjectModel subjectModel = SubjectModel();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int sID = 0;
  final firestoreref =
      FirebaseFirestore.instance.collection("Subjects").snapshots();
  void updateSubjectID() async {
    await firestore.collection("SubjectID").doc(sID.toString()).set({
      "lastsignID": sID,
    }).then((value) => getLastAsignedSubjectID());
  }

  void getLastAsignedSubjectID() async {
    final lastID =
        await firestore.collection("SubjectID").doc(sID.toString()).get();
    sID = lastID["lastsignID"];
    sID++;
    setState(() {});
  }

  @override
  void initState() {
    getLastAsignedSubjectID();
    super.initState();
  }

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
                "Subjects",
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
                    "Subjects",
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
                        "All Subject",
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
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width / 180),
                              child: const Text(
                                "Subject  Name",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width / 180),
                              child: const Text(
                                "Teacher",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width / 180),
                              child: const Text(
                                "Classes",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width / 180),
                              child: const Text(
                                "Dayes",
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
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 1,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: firestoreref,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshots) {
                            if (snapshots.connectionState ==
                                ConnectionState.waiting) {
                              return const Text("");
                            }
                            if (snapshots.hasError) {
                              return const Text("Some error occured");
                            }
                            return ListView.builder(
                                itemCount: snapshots.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return Table(
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    border: TableBorder.symmetric(
                                      outside: const BorderSide(
                                          width: 1, color: Colors.white),
                                    ),
                                    children: [
                                      TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  180),
                                          child: Text(
                                            snapshots.data!
                                                .docs[index]["subjectName"]
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  180),
                                          child: Text(
                                            snapshots.data!.docs[index]
                                                ["teacherName"],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  180),
                                          child: Text(
                                            snapshots.data!.docs[index]
                                                ["classes"],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  180),
                                          child: Text(
                                            snapshots.data!.docs[index]
                                                ["dayes"],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        )
                                      ])
                                    ],
                                  );
                                });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
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
                        "Add New Subject",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Form(
                          key: formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Subject Name *",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                80,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        child: TextFormField(
                                          controller: subjectName,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Teacher *",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                80,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        child: TextFormField(
                                          controller: teacher,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Classes *",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                80,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        child: TextFormField(
                                          controller: classes,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Dayes *",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                80,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        child: TextFormField(
                                          controller: dayes,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              subjectModel.subjectName = subjectName.text;
                              subjectModel.teacherName = teacher.text;
                              subjectModel.classes = classes.text;
                              subjectModel.dayes = dayes.text;
                              subjectModel.subjectID = sID;
                              await firestore
                                  .collection("Subjects")
                                  .doc(sID.toString())
                                  .set(subjectModel.toJson())
                                  .then((value) => {
                                        searchController =
                                            TextEditingController(),
                                        subjectName = TextEditingController(),
                                        teacher = TextEditingController(),
                                        classes = TextEditingController(),
                                        dayes = TextEditingController(),
                                        setState(() {}),
                                        Utilities()
                                            .toastMessage("Subject Added")
                                      })
                                  .onError((error, stackTrace) => {
                                        Utilities()
                                            .toastMessage(error.toString()),
                                      });

                              updateSubjectID();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 16,
                              height: MediaQuery.of(context).size.height / 20,
                              decoration: BoxDecoration(
                                color: Constants.purpleLight,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: const Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 16,
                            height: MediaQuery.of(context).size.height / 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Center(
                              child: Text(
                                "Reset",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
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
