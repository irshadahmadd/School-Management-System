import 'package:flutter/material.dart';

import '../../../Core/Constants/constants.dart';

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
GlobalKey formkey = GlobalKey<FormState>();

//Parents Controllers
TextEditingController fatherName = TextEditingController();
TextEditingController motherName = TextEditingController();
TextEditingController parentsEmail = TextEditingController();
TextEditingController parentsPhone = TextEditingController();
TextEditingController parentsOccupation = TextEditingController();
TextEditingController parentsAddress = TextEditingController();
TextEditingController parentsReligion = TextEditingController();
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

class StudentPromotion extends StatefulWidget {
  const StudentPromotion({super.key});

  @override
  State<StudentPromotion> createState() => _StudentPromotionState();
}

class _StudentPromotionState extends State<StudentPromotion> {
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
                                              return "Enter DOB";
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
