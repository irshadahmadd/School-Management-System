import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:school_managment_system/Core/Models/students_model.dart';
import 'package:school_managment_system/Core/Utilities/utils.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  GlobalKey formkey = GlobalKey<FormState>();
  StudentModel studentModel = StudentModel();
  final fireStoreRef = FirebaseFirestore.instance.collection('Student');
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool loading = false;

  //Student Controllers
  TextEditingController studentName = TextEditingController();
  TextEditingController studentGender = TextEditingController();
  TextEditingController studentClass = TextEditingController();
  TextEditingController studentDOB = TextEditingController();
  TextEditingController studentBloodGroup = TextEditingController();
  TextEditingController studentReligion = TextEditingController();
  TextEditingController studentAdmissionDate = TextEditingController();
  String dropdownvalueGender = '';
  String dropdownvalueClass = '';
  String dropdownvalueReligion = '';
  DateTime date = DateTime.now();

  //Parents Controllers
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController parentsEmail = TextEditingController();
  TextEditingController parentsPhone = TextEditingController();
  TextEditingController parentsOccupation = TextEditingController();
  TextEditingController parentsAddress = TextEditingController();
  TextEditingController parentsReligion = TextEditingController();
  int id = 0;
  void studentIdUpdate() async {
    await firestore
        .collection("StudentID")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set({"lastAssignId": id});
  }

  // getting last id

  void getLastId() async {
    final result = await firestore
        .collection("StudentID")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    id = result['lastAssignId'];
    id++;
  }

  @override
  void initState() {
    getLastId();
    super.initState();
    // id++;
    // studentIdUpdate();
  }

  //drop Downs Lists
  var itemsGender = [
    '',
    'Male',
    'Female',
    'Other',
  ];
  var itemsClass = [
    '',
    'First',
    'Second',
    'Third',
    'Fourth',
    'Fifth',
    'Sixth',
    'Seventh',
    'Eight',
    'Ninth',
    'Tenth',
  ];
  var itemsReligion = [
    '',
    'Islam',
    'Hindu',
    'Christan',
    'Jew',
    'Other',
  ];
  String profilePicLink = "";
  Reference ref = FirebaseStorage.instance.ref().child("profilepic.jpg");
  Future pickStudentImage() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final image =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.getImage(source: ImageSource.gallery);
    await ref.putFile(File(image!.path));

    ref.getDownloadURL().then((value) async {
      setState(() {
        profilePicLink = value;
      });
    });
  }

  File? file;
  final fstore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Students",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    await fstore
                        .collection('students')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .set({
                      'akdjf': 'kadjfk',
                    });
                  },
                  child: const Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                const Icon(
                  Icons.arrow_right_sharp,
                  color: Colors.red,
                  size: 20,
                ),
                const Text(
                  "Students admit form data",
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
                        "Add New Students",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 80,
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
                                        "Name *",
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
                                          controller: studentName,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                          validator: (value) {
                                            if (studentName.text.isEmpty) {
                                              return 'Enter your name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Gender *",
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
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller: studentGender,
                                          decoration:
                                              kTtextfieldDecoration.copyWith(
                                            suffixIcon: DropdownButton(
                                              isExpanded: false,
                                              dropdownColor:
                                                  Colors.grey.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              underline: const SizedBox(),

                                              // Initial Value
                                              value: dropdownvalueGender,
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.white,
                                              ),
                                              // Array list of items
                                              items: itemsGender
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(
                                                    items,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  studentGender.text =
                                                      newValue.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          validator: (value) {
                                            if (studentGender.text.isEmpty) {
                                              return "Select Gender";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Class *",
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
                                          controller: studentClass,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(
                                            suffixIcon: DropdownButton(
                                              isExpanded: false,
                                              dropdownColor:
                                                  Colors.grey.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              underline: const SizedBox(),

                                              // Initial Value
                                              value: dropdownvalueClass,
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.white,
                                              ),
                                              // Array list of items
                                              items: itemsClass
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(
                                                    items,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  studentClass.text =
                                                      newValue.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          validator: (value) {
                                            if (studentClass.text.isEmpty) {
                                              return "Enter class";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "DOB *",
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
                                          controller: studentDOB,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(
                                                  suffixIcon: ElevatedButton(
                                            onPressed: () async {
                                              DateTime? newDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: date,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100),
                                              );
                                              setState(() {
                                                studentDOB.text =
                                                    "${newDate!.day}:${newDate.month}:${newDate.year}";
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap),
                                            child: const Icon(
                                              Icons.date_range,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          )),
                                          validator: (value) {
                                            if (studentDOB.text.isEmpty) {
                                              return "Enter DOM";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Blood Group *",
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
                                          controller: studentBloodGroup,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                          validator: (value) {
                                            if (studentBloodGroup
                                                .text.isEmpty) {
                                              return 'Enter Blood Group ';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Select Religion *",
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
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller: studentReligion,
                                          decoration:
                                              kTtextfieldDecoration.copyWith(
                                            suffixIcon: DropdownButton(
                                              isExpanded: false,
                                              dropdownColor:
                                                  Colors.grey.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              underline: const SizedBox(),

                                              // Initial Value
                                              value: dropdownvalueReligion,
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.white,
                                              ),
                                              // Array list of items
                                              items: itemsReligion
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(
                                                    items,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  studentReligion.text =
                                                      newValue.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          validator: (value) {
                                            if (studentReligion.text.isEmpty) {
                                              return "Select Gender";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Admission date *",
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
                                          controller: studentAdmissionDate,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(
                                                  suffixIcon: ElevatedButton(
                                            onPressed: () async {
                                              DateTime? newDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: date,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100),
                                              );
                                              setState(() {
                                                studentAdmissionDate.text =
                                                    "${newDate!.day}:${newDate.month}:${newDate.year}";
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap),
                                            child: const Icon(
                                              Icons.date_range,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          )),
                                          validator: (value) {
                                            if (studentAdmissionDate
                                                .text.isEmpty) {
                                              return "Enter admission date";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        " ",
                                        style: TextStyle(
                                            color: Colors.transparent),
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
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                              const Text(
                                "Add New Parents",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Father Name *",
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
                                          controller: fatherName,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                          validator: (value) {
                                            if (fatherName.text.isEmpty) {
                                              return 'Enter father name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Mother Name *",
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
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller: motherName,
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                          validator: (value) {
                                            if (motherName.text.isEmpty) {
                                              return "Enter mother name";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Email *",
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
                                          controller: parentsEmail,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                          validator: (value) {
                                            if (studentClass.text.isEmpty) {
                                              return "Enter email";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Phone *",
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
                                          controller: parentsPhone,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                          validator: (value) {
                                            if (parentsPhone.text.isEmpty) {
                                              return "Enter phone";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Father Occupation *",
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
                                          controller: parentsOccupation,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                          validator: (value) {
                                            if (parentsOccupation
                                                .text.isEmpty) {
                                              return 'Enter occupation';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Address *",
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
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller: parentsAddress,
                                          decoration:
                                              kTtextfieldDecoration.copyWith(),
                                          validator: (value) {
                                            if (parentsAddress.text.isEmpty) {
                                              return "Enter address";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Select Religion *",
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
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller: parentsReligion,
                                          decoration:
                                              kTtextfieldDecoration.copyWith(
                                            suffixIcon: DropdownButton(
                                              isExpanded: false,
                                              dropdownColor:
                                                  Colors.grey.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              underline: const SizedBox(),

                                              // Initial Value
                                              value: dropdownvalueReligion,
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.white,
                                              ),
                                              // Array list of items
                                              items: itemsReligion
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(
                                                    items,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  parentsReligion.text =
                                                      newValue.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          validator: (value) {
                                            if (studentReligion.text.isEmpty) {
                                              return "Select Gender";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        " ",
                                        style: TextStyle(
                                            color: Colors.transparent),
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
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(profilePicLink),
                            radius: 50,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Upload Student Picture",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      pickStudentImage();
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          13,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      decoration: BoxDecoration(
                                          color: Constants.purpleLight,
                                          border: Border.all(
                                              width: 2, color: Colors.white)),
                                      child: const Center(
                                        child: Text(
                                          "Choose file",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 100,
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
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              
                              studentModel.studentN = studentName.text;
                              studentModel.studentG = studentGender.text;
                              studentModel.studentC = studentClass.text;
                              studentModel.studentDOB = studentDOB.text;
                              studentModel.studentBG = studentBloodGroup.text;
                              studentModel.studentR = studentReligion.text;
                              studentModel.studentAD =
                                  studentAdmissionDate.text;
                              studentModel.fatherN = fatherName.text;
                              studentModel.motherN = motherName.text;
                              studentModel.parentE = parentsEmail.text;
                              studentModel.parentP = parentsPhone.text;
                              studentModel.parentO = parentsOccupation.text;
                              studentModel.parentA = parentsAddress.text;
                              studentModel.parentR = parentsReligion.text;
                              studentModel.studentID = id;
                              await firestore
                                  .collection("Student")
                                  .doc(id.toString())
                                  .set(studentModel.toJson())
                                  .then((value) {
                                setState(() {
                                  loading = false;
                                });
                                Utilities().toastMessage("Added");
                              }).onError((error, stackTrace) {
                                setState(() {
                                  loading = false;
                                });
                                Utilities().toastMessage(error.toString());
                              });
                              studentIdUpdate();
                              
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
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
