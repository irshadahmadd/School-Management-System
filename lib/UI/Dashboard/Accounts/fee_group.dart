import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_managment_system/Core/Constants/constants.dart';
import 'package:school_managment_system/Core/provider/student_provider.dart';

class FeeGroup extends StatefulWidget {
  const FeeGroup({super.key});
  @override
  State<FeeGroup> createState() => _FeeGroupState();
}

class _FeeGroupState extends State<FeeGroup> {
  TextEditingController sbyNameContoller = TextEditingController();
  TextEditingController sbyClassContoller = TextEditingController();
  TextEditingController searchController = TextEditingController();
  final firestore =
      FirebaseFirestore.instance.collection("Student").snapshots();
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
                "Account",
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
                    "Fee Group",
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
                        "All Accounts Data",
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
                          Row(
                            children: const [
                              Icon(
                                Icons.list_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                "Fees Group List",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
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
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 180,
                                  top: MediaQuery.of(context).size.width / 150,
                                  bottom:
                                      MediaQuery.of(context).size.width / 150,
                                ),
                                child: const Text(
                                  "Number",
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
                                  "Name",
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
                                  "Fees Type",
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
                                  "Description",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1,
                        width: MediaQuery.of(context).size.width / 1,
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border:
                              TableBorder.all(width: 1, color: Colors.white),
                          children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 180,
                                    top:
                                        MediaQuery.of(context).size.width / 150,
                                    bottom:
                                        MediaQuery.of(context).size.width / 150,
                                  ),
                                  child: const Text(
                                    "text",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 180,
                                    top:
                                        MediaQuery.of(context).size.width / 150,
                                    bottom:
                                        MediaQuery.of(context).size.width / 150,
                                  ),
                                  child: const Text(
                                    "text",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 180,
                                    top:
                                        MediaQuery.of(context).size.width / 150,
                                    bottom:
                                        MediaQuery.of(context).size.width / 150,
                                  ),
                                  child: const Text(
                                    "text",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 180,
                                    top:
                                        MediaQuery.of(context).size.width / 150,
                                    bottom:
                                        MediaQuery.of(context).size.width / 150,
                                  ),
                                  child: const Text(
                                    "text",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
