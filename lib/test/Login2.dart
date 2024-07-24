import 'package:final_project/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => Login2State();
}

class Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 5,
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
                        fontSize: 55,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: const StadiumBorder(side: BorderSide.none)),
                        onPressed: () async {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          // show loading
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return Center(
                          //           child: CircularProgressIndicator());
                          //     });
                          await provider.GoogleLogin();
                          // pop loading
                          // Navigator.of(context).pop();
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.amber,
                        ),
                        label: const Text(
                          "Sign In With Google",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       "Don't have an account? ",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     GestureDetector(
                    //       child: const Text(
                    //         'Sign Up',
                    //         style: TextStyle(
                    //           decoration: TextDecoration.underline,
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //       onTap: () {
                    //         // Navigator.pushReplacement(
                    //         //   context,
                    //         //   MaterialPageRoute(builder: (context) => ()),
                    //         // );
                    //       },
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
