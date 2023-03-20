import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_managment_system/Core/Models/students_model.dart';
import 'package:school_managment_system/Core/Utilities/utils.dart';
import '../../../Core/Constants/constants.dart';

StudentModel studentModel = StudentModel();
TextEditingController studentName = TextEditingController();
TextEditingController fatherName = TextEditingController();
TextEditingController studentClass = TextEditingController();
TextEditingController promotionClass = TextEditingController();
GlobalKey formkey = GlobalKey<FormState>();
FirebaseFirestore firestore = FirebaseFirestore.instance;
String dropdownvalueGender = '';
String dropdownvalueClass = '';
String dropdownvalueReligion = '';
DateTime date = DateTime.now();
// ignore: non_constant_identifier_names
String? GlobalID;

var currentStudentsNames = [
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
void getCurrentStudents() {}

class StudentPromotion extends StatefulWidget {
  const StudentPromotion({super.key});
  @override
  State<StudentPromotion> createState() => _StudentPromotionState();
}

class _StudentPromotionState extends State<StudentPromotion> {
  String? pclass;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  "Home",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: Colors.red,
                ),
                Text(
                  "Students Promotions",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
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
                        "Promot Students",
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
                                              kTtextfieldDecoration.copyWith(
                                            hintText: studentModel.studentN,
                                            hintStyle: const TextStyle(
                                                color: Colors.white),
                                          ),
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
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller: fatherName,
                                          decoration:
                                              kTtextfieldDecoration.copyWith(
                                                  hintText:
                                                      studentModel.fatherN,
                                                  hintStyle: const TextStyle(
                                                      color: Colors.white)),
                                          validator: (value) {
                                            if (fatherName.text.isEmpty) {
                                              return "Enter Father Name";
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
                                        "Current Class *",
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
                                                  hintText:
                                                      studentModel.studentC,
                                                  hintStyle: const TextStyle(
                                                      color: Colors.white)),
                                          validator: (value) {
                                            if (studentClass.text.isEmpty) {
                                              return "Enter Current class";
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
                                        "Promoted To Class*",
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
                                          controller: promotionClass,
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
                                              items: currentStudentsNames
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
                                                  promotionClass.text =
                                                      newValue.toString();
                                                  // print(
                                                  //     "Promotion class=================>>>>>>>>$newValue");
                                                });
                                              },
                                            ),
                                          ),
                                          onChanged: (val) {
                                            pclass = val;
                                          },
                                          validator: (value) {
                                            if (promotionClass.text.isEmpty) {
                                              return "Enter Promotion class";
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
                            ],
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              // studentModel.studentN = studentName.text;
                              // studentModel.studentG = studentGender.text;
                              // studentModel.studentC = studentClass.text;
                              // studentModel.studentDOB = studentDOB.text;
                              // studentModel.studentBG = studentBloodGroup.text;
                              // studentModel.studentR = studentReligion.text;
                              // studentModel.studentAD =
                              //     studentAdmissionDate.text;
                              // studentModel.fatherN = fatherName.text;
                              // studentModel.motherN = motherName.text;
                              // studentModel.parentE = parentsEmail.text;
                              // studentModel.parentP = parentsPhone.text;
                              // studentModel.parentO = parentsOccupation.text;
                              // studentModel.parentA = parentsAddress.text;
                              // studentModel.parentR = parentsReligion.text;
                              // studentModel.studentID = id;

                              // print("this is  id $GlobalID");
                              pclass = promotionClass.text;
                              FirebaseFirestore.instance
                                  .collection('Student')
                                  .doc("$GlobalID")
                                  .update({'studentC': '$pclass'})
                                  .then((value) => {
                                        Utilities()
                                            .toastMessage("Student Promoted"),
                                        promotionClass =
                                            TextEditingController(),
                                      })
                                  .onError((error, stackTrace) => {
                                        Utilities()
                                            .toastMessage(error.toString()),
                                      });
                              // print("Lasst Id============>$id");
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
