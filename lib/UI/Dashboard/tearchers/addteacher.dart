import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:school_managment_system/Core/Models/teacher_model.dart';
import 'package:school_managment_system/Core/Utilities/utils.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({Key? key}) : super(key: key);
  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TeacherModel teacherModel = TeacherModel();
  // final fireStoreRef = FirebaseFirestore.instance.collection('Teacher');
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool loading = false;

  int tID = 0;

  String? logourl;
  uploadprofilePic() async {
    FilePickerResult? filePickerResult;
    filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ["jpg", "png", "svg"]);
    if (filePickerResult != null) {
      try {
        final bts = filePickerResult.files.single.bytes;
        var name = filePickerResult.files.single.name;
        // print('image uploaded');
        // print('image uploaded');
        final refrence =
            FirebaseStorage.instance.ref().child("profiePics/$name");
        final uploadTask = refrence.putData(bts!);
        final snapshot = await uploadTask;
        logourl = await snapshot.ref.getDownloadURL();
        setState(() {});
        // print("=========================$logourl");
      } catch (e) {
        // print(e);
      }
    }
  }

  //Student Controllers
  TextEditingController teacherFName = TextEditingController();
  TextEditingController teacherLName = TextEditingController();
  TextEditingController teacherGender = TextEditingController();
  TextEditingController teacherEmail = TextEditingController();
  TextEditingController teacherDOB = TextEditingController();
  TextEditingController joiningDate = TextEditingController();
  TextEditingController teacherPhone = TextEditingController();
  TextEditingController teacherBloodGroup = TextEditingController();
  TextEditingController teacherReligion = TextEditingController();
  TextEditingController teacherJoiningDate = TextEditingController();
  TextEditingController teacherSubject = TextEditingController();
  TextEditingController teacherAddress = TextEditingController();
  String dropdownvalueGender = '';
  String dropdownvalueReligion = '';
  DateTime date = DateTime.now();
  //Parents Controllers

  void teacherIdUpdate() async {
    await firestore
        .collection("TeacherID")
        .doc(tID.toString())
        .set({"lastAssignId": tID}).then((value) => {
              getLastId(),
            });
  }

  // getting last id

  void getLastId() async {
    final result =
        await firestore.collection("TeacherID").doc(tID.toString()).get();
    tID = result['lastAssignId'];
    tID++;
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
  var itemsReligion = [
    '',
    'Islam',
    'Hindu',
    'Christan',
    'Jew',
    'Other',
  ];
  String? imageUrl;
  // Reference ref = FirebaseStorage.instance.ref().child("profilepic");
  Future pickStudentImage() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final image =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.getImage(source: ImageSource.gallery);
    // ignore: unused_local_variable
    var file = File(image!.path);

    // print(image.toString());

    // else {
    //   return "Image not pickrd";
    // }
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
              "Teachers",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            Row(
              children: const [
                Text(
                  "Home",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Icon(
                  Icons.arrow_right_sharp,
                  color: Colors.red,
                  size: 20,
                ),
                Text(
                  "Teacher data",
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
                      "Add New Teacher",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Frist Name *",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        controller: teacherFName,
                                        onFieldSubmitted: (value) {
                                          teacherFName.clear();
                                        },
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration:
                                            kTtextfieldDecoration.copyWith(),
                                        validator: (value) {
                                          if (teacherFName.text.isEmpty) {
                                            return 'Enter frist your name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Last Name *",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        style: const TextStyle(
                                            color: Colors.white),
                                        controller: teacherLName,
                                        onFieldSubmitted: (value) {
                                          teacherLName.clear();
                                        },
                                        decoration:
                                            kTtextfieldDecoration.copyWith(),
                                        validator: (value) {
                                          if (teacherLName.text.isEmpty) {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        controller: teacherGender,
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
                                            value: dropdownvalueGender,
                                            // Down Arrow Icon
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.white,
                                            ),
                                            // Array list of items
                                            items:
                                                itemsGender.map((String items) {
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
                                                teacherGender.text =
                                                    newValue.toString();
                                              });
                                            },
                                          ),
                                        ),
                                        validator: (value) {
                                          if (teacherGender.text.isEmpty) {
                                            return "Enter Gender";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        controller: teacherDOB,
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
                                              teacherDOB.text =
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
                                          if (teacherDOB.text.isEmpty) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        controller: teacherBloodGroup,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration:
                                            kTtextfieldDecoration.copyWith(),
                                        validator: (value) {
                                          if (teacherBloodGroup.text.isEmpty) {
                                            return 'Enter Blood Group ';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        style: const TextStyle(
                                            color: Colors.white),
                                        controller: teacherReligion,
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
                                                teacherReligion.text =
                                                    newValue.toString();
                                              });
                                            },
                                          ),
                                        ),
                                        validator: (value) {
                                          if (teacherReligion.text.isEmpty) {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        controller: teacherEmail,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration:
                                            kTtextfieldDecoration.copyWith(),
                                        validator: (value) {
                                          if (teacherEmail.text.isEmpty) {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        controller: teacherPhone,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration:
                                            kTtextfieldDecoration.copyWith(),
                                        validator: (value) {
                                          if (teacherPhone.text.isEmpty) {
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Subject *",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        controller: teacherSubject,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration:
                                            kTtextfieldDecoration.copyWith(),
                                        validator: (value) {
                                          if (teacherSubject.text.isEmpty) {
                                            return 'Enter Subject';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        style: const TextStyle(
                                            color: Colors.white),
                                        controller: teacherAddress,
                                        decoration:
                                            kTtextfieldDecoration.copyWith(),
                                        validator: (value) {
                                          if (teacherSubject.text.isEmpty) {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Joining Date *",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: TextFormField(
                                        style: const TextStyle(
                                            color: Colors.white),
                                        controller: teacherJoiningDate,
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
                                              teacherJoiningDate.text =
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
                                          if (teacherJoiningDate.text.isEmpty) {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      " ",
                                      style:
                                          TextStyle(color: Colors.transparent),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 7,
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
                          backgroundImage: NetworkImage("$logourl"),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      uploadprofilePic();
                                      // print(
                                      //     "=====================================>>>>>>>>>>>>>>>>>>>$imageUrl");
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 13,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
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
                            teacherModel.tFname = teacherFName.text;
                            teacherModel.tLtName = teacherLName.text;
                            teacherModel.tGender = teacherGender.text;
                            teacherModel.tDOB = teacherDOB.text;
                            teacherModel.tbGroup = teacherBloodGroup.text;
                            teacherModel.treligion = teacherReligion.text;
                            teacherModel.temail = teacherEmail.text;
                            teacherModel.tphone = teacherPhone.text;
                            teacherModel.tsubject = teacherSubject.text;
                            teacherModel.taddrss = teacherAddress.text;
                            teacherModel.tjoiningDate = teacherJoiningDate.text;
                            teacherModel.teacherID = tID;

                            const CircularProgressIndicator(
                              strokeWidth: 7,
                              color: Colors.amber,
                            );
                            await firestore
                                .collection("Teachers")
                                .doc(tID.toString())
                                .set(teacherModel.toJson())
                                .then((value) {
                              teacherFName = TextEditingController();
                              teacherLName = TextEditingController();
                              teacherGender = TextEditingController();
                              teacherDOB = TextEditingController();
                              joiningDate = TextEditingController();
                              teacherBloodGroup = TextEditingController();
                              teacherReligion = TextEditingController();
                              teacherJoiningDate = TextEditingController();
                              teacherSubject = TextEditingController();
                              teacherAddress = TextEditingController();
                              setState(() {
                                loading = false;
                              });
                              Utilities().toastMessage("Teacher Added");
                            }).onError((error, stackTrace) {
                              setState(() {
                                loading = false;
                              });
                              Utilities().toastMessage(error.toString());
                            });
                            teacherIdUpdate();
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
    );
  }
}
