import 'package:final_project/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestProfileGoogle extends StatelessWidget {
  const TestProfileGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged in'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile'),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + user.displayName!,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ' + user.email!,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            if (user.phoneNumber != null)
              Text(
                'Phone: ' + user.phoneNumber!,
                style: TextStyle(color: Colors.white),
              ),
            if (user.phoneNumber == null)
              Text(
                'Phone: -',
                style: TextStyle(color: Colors.white),
              ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
