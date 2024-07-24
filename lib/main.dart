// import 'package:final_project/first_page.dart';
// import 'package:final_project/order_status/orderstatus.dart';
// import 'package:final_project/order_status/orderstatus2.dart';
// import 'package:final_project/pages/homepage.dart';
// import 'package:final_project/provider/google_sign_in.dart';
// import 'package:final_project/test/test_display.dart';
// import 'package:final_project/test/test_home_google.dart';
// import 'package:final_project/test/test_login.dart';
// import 'package:final_project/test_pages/home.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:final_project/test_pages/login3.dart';

// Future<void> main(List<String> args) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => GoogleSignInProvider(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         // First page
//         // home: TestHomeGoogle(),
//         // home: Login3(),
//         home: Orderstatus2(),
//         // Theme data
//         theme: ThemeData(
//           // scaffoldBackgroundColor: Colors.transparent,
//           scaffoldBackgroundColor: Colors.grey,
//           inputDecorationTheme: const InputDecorationTheme(
//             suffixIconColor: Colors.white,
//             prefixIconColor: Colors.white,
//             hintStyle:
//                 TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.white),
//             ),
//           ),
//           elevatedButtonTheme: ElevatedButtonThemeData(
//               style: ElevatedButton.styleFrom(
//             shape: const StadiumBorder(side: BorderSide.none),
//             padding: const EdgeInsets.all(10),
//             backgroundColor: Color.fromARGB(255, 32, 158, 187),
//           )),
//           textTheme: const TextTheme(
//               titleLarge: TextStyle(color: Colors.amber),
//               titleMedium: TextStyle(color: Colors.white),
//               bodyMedium: TextStyle(color: Colors.white)),
//           appBarTheme: const AppBarTheme(
//             backgroundColor: Colors.amber,
//             centerTitle: true,
//           ),
//         ),
//       ),
//     ),
//   );
// }
