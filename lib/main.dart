import 'package:bai_tap/features/auth/auth_controller.dart';
import 'package:bai_tap/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/auth/screens/log_in_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: const FirebaseOptions(
        apiKey: "AIzaSyD2lJ1XL18syI8X9mkFweIrHbRGM5QqcxY",
        authDomain: "thuc-hanh-tcm.firebaseapp.com",
        projectId: "thuc-hanh-tcm",
        storageBucket: "thuc-hanh-tcm.appspot.com",
        messagingSenderId: "421467771201",
        appId: "1:421467771201:web:d0a14c4eba14c72c4bd1c0",
        measurementId: "G-ZFP850H9P6"
        ),
  );
  runApp(const MyApp(),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
  ); 
}
