import 'package:final_project/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Profile2 extends StatelessWidget {
  Profile2({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text('Profile',
            style: TextStyle(fontSize: 24, color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              // show loading
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(child: CircularProgressIndicator());
                  });
              provider.logout();
              // pop loading circle
              Navigator.of(context).pop();
            },
            child: Text('Logout', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //   https://cdn-icons-png.flaticon.com/512/1077/1077063.png

            Center(
              // child: CircleAvatar(
              //   backgroundImage: NetworkImage(
              //       "https://cdn-icons-png.flaticon.com/512/1077/1077063.png"),
              //   radius: 47,
              //   backgroundColor: Colors.white,
              // ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL!),
                radius: 47,
                backgroundColor: Colors.white,
              ),
            ),
            Divider(
              color: Colors.amber,
              thickness: 2,
              height: 60,
            ),

            // ),
            SizedBox(height: 25),
            Column(
              children: [
                Container(
                    height: 40,
                    width: 335,
                    decoration: ShapeDecoration(
                        color: Colors.grey[800],
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Name ' + user.displayName!,
                        style: TextStyle(color: Colors.amber, fontSize: 15),
                        // ), Text(
                        //  user.displayName!,
                        //   style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: 40,
                    width: 335,
                    decoration: ShapeDecoration(
                        color: Colors.grey[800],
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Email ' + user.email!,
                        style: TextStyle(color: Colors.amber, fontSize: 15),
                      ),
                      // Text(
                      //   user.email!,
                      //   style: TextStyle(color: Colors.white, fontSize: 15),
                      // ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: 335,
                  decoration: ShapeDecoration(
                      color: Colors.grey[800],
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        if (user.phoneNumber != null)
                          Text(
                            "Phone ${user.phoneNumber!}",
                            style: TextStyle(color: Colors.amber, fontSize: 15),
                          ),
                        if (user.phoneNumber == null)
                          const Text(
                            'Phone -',
                            style: TextStyle(color: Colors.amber, fontSize: 15),
                          ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 15,
                // ),
                // Container(
                //     height: 40,
                //     width: 335,
                //     decoration: ShapeDecoration(
                //         color: Colors.black,
                //         shape: ContinuousRectangleBorder(
                //             borderRadius: BorderRadius.circular(25))),
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(
                //         'Password',
                //         style: TextStyle(color: Colors.amber, fontSize: 15),
                //       ),
                //     )),
                // SizedBox(
                //   height: 15,
                // ),
                // Container(
                //     height: 40,
                //     width: 335,
                //     decoration: ShapeDecoration(
                //         color: Colors.black,
                //         shape: ContinuousRectangleBorder(
                //             borderRadius: BorderRadius.circular(25))),
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(
                //         'Address',
                //         style: TextStyle(color: Colors.amber, fontSize: 15),
                //       ),
                //     )),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8),
      //   child: Container(
      //     decoration: const BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(90),
      //       ),
      //     ),
      //     child: const Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      //       child: GNav(
      //         backgroundColor: Colors.white,
      //         color: Colors.black,
      //         activeColor: Colors.black,
      //         tabBackgroundColor: Colors.grey,
      //         gap: 8,
      //         padding: EdgeInsets.all(8),
      //         tabs: [
      //           GButton(
      //             icon: Icons.home,
      //             text: 'Home',
      //           ),
      //           GButton(
      //             icon: Icons.upload,
      //             text: 'Upload',
      //           ),
      //           GButton(
      //             icon: Icons.person,
      //             text: 'Me',
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
