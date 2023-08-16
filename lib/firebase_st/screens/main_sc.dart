// import 'package:app_build/firebase_st/screens/phone_no_otp.dart';
// import 'package:app_build/firebase_st/screens/sign_in.dart';
// import 'package:app_build/firebase_st/screens/sign_up.dart';
// import 'package:app_build/firebase_st/screens/welcome_Screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// import 'google_acnt_add.dart';
//
// void main()async
// {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MYapp());
// }
//
// class MYapp extends StatefulWidget {
//   const MYapp({Key? key}) : super(key: key);
//
//   @override
//   State<MYapp> createState() => _MYappState();
// }
//
// class _MYappState extends State<MYapp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       debugShowCheckedModeBanner: false,
//       title: "main",
//       routes: {
//         "1": (context) => signin(),
//         "2": (context) => signup(),
//         "3": (context) => google_acount(),
//         "4": (context) => phone__otp(),
//         "5":(context) => welcome_sc()
//       },
//       initialRoute: "1",
//     );
//     return const Placeholder();
//   }
// }
