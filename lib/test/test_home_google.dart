import 'package:final_project/profile.dart';
import 'package:final_project/profile2.dart';
import 'package:final_project/test/Login2.dart';
import 'package:final_project/test/test_display.dart';
import 'package:final_project/test/test_login.dart';
import 'package:final_project/test/test_profile_google.dart';
import 'package:final_project/test_pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestHomeGoogle extends StatelessWidget {
  const TestHomeGoogle({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (snapshot.hasData) {
              return TestDisplay();
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            } else {
              return Login2();
            }
          },
        ),
      );
}
