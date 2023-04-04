import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:school_managment_system/Core/Utilities/signup.dart';
import 'package:school_managment_system/Core/provider/student_provider.dart';
import 'package:school_managment_system/UI/Dashboard/dashboard_1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDumMSc-cByEgz_OThUczVeSODsbG_uo6Q",
        authDomain: "school-management-app-71121.firebaseapp.com",
        projectId: "school-management-app-71121",
        storageBucket: "school-management-app-71121.appspot.com",
        messagingSenderId: "772890261828",
        appId: "1:772890261828:web:848e9defdaf3b1ca9e7f11",
        measurementId: "G-4YGT0NN59W"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'School Management System',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TestingScreen()),
    );
  }
}
