// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Productlist/yourproduct.dart';
import 'package:final_project/Productlist/yourproduct2.dart';
import 'package:final_project/profile.dart';
import 'package:final_project/profile2.dart';
import 'package:final_project/test/test_home_google.dart';
import 'package:final_project/test_pages/home.dart';
import 'package:final_project/test_pages/home2.dart';
import 'package:final_project/test_pages/upload.dart';
import 'package:final_project/test_pages/upload2.dart';
import 'package:flutter/material.dart';

class TestDisplay extends StatefulWidget {
  const TestDisplay({super.key});

  @override
  State<TestDisplay> createState() => _TestDisplayState();
}

class _TestDisplayState extends State<TestDisplay> {
  int _currentIndex = 0;

  final screens = [Home2(), AddProduct(), YourProduct2(), Profile2()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.amber,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                activeIcon: Icon(
                  Icons.home,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.upload_outlined),
                label: 'Sell',
                activeIcon: Icon(Icons.upload)),
            BottomNavigationBarItem(
                icon: Icon(Icons.store_outlined),
                label: 'My Product',
                activeIcon: Icon(Icons.store)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: 'Me',
                activeIcon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
