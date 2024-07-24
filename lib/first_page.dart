import 'package:final_project/login.dart';
import 'package:final_project/product_name.dart';
import 'package:final_project/signup.dart';
import 'package:final_project/profile.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.3, 0.9],
          colors: [
            Colors.white,
            Color.fromARGB(255, 107, 134, 147),
            Color.fromARGB(255, 2, 48, 71),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/3037/3037005.png",
                              width: 100,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/3037/3037071.png",
                              width: 100,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/3037/3037071.png",
                              width: 100,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/3037/3037005.png",
                              width: 100,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'GLONG GAO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 20, letterSpacing: 1.2),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style:
                                  TextStyle(fontSize: 20, letterSpacing: 1.2),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 300,
                          height: 20,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: const StadiumBorder(side: BorderSide.none),
                              padding: const EdgeInsets.all(12),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()),
                              );
                            },
                            child: const Text(
                              'Temp button for profile',
                              style:
                                  TextStyle(fontSize: 20, letterSpacing: 1.2),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 300,
                          height: 20,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: const StadiumBorder(side: BorderSide.none),
                              padding: const EdgeInsets.all(12),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductNames()),
                              );
                            },
                            child: const Text(
                              'Temp button for product_name',
                              style:
                                  TextStyle(fontSize: 20, letterSpacing: 1.2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
