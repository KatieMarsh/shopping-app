import 'package:final_project/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

//   int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //   https://cdn-icons-png.flaticon.com/512/1077/1077063.png

            Center(
              // child: CircleAvatar(
              //   backgroundImage: NetworkImage(
              //       "https://cdn-icons-png.flaticon.com/512/1077/1077063.png"),
              //   radius: 50,
              //   backgroundColor: Colors.white,
              // ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL!),
                radius: 50,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Name',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            // Text(
            //   'xxxx xxxx',
            //   style: TextStyle(color: Colors.white, fontSize: 18),
            // ),
            Text(
              user.displayName!,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'Email',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            // const Text(
            //   'xx@gxxx.xxx',
            //   style: TextStyle(color: Colors.white, fontSize: 15),
            // ),
            Text(
              user.email!,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 16),
            Text(
              'Phone',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            if (user.phoneNumber != null)
              Text(
                user.phoneNumber!,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            if (user.phoneNumber == null)
              const Text(
                'xxx-xxxx-xxx',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            const SizedBox(height: 16),
            Text(
              'Password',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              'Address',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Text(
              'xxxxxxxxxxxx',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const Text(
              'xxxxxxxxxxxx',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.chat_bubble), label: 'chat'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'me'),
      //   ],
      //   // currentIndex: currentIndex,
      //   // onTap: (index) => setState(() => currentIndex = index),
      // ),
    );
  }
}
