import 'package:flutter/material.dart';

class Login3 extends StatefulWidget {
  Login3({super.key});

  @override
  State<Login3> createState() => _Login3State();
}

class _Login3State extends State<Login3> {
  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/3037/3037005.png",
                        width: 40,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/3037/3037071.png",
                        width: 40,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/3037/3037071.png",
                        width: 40,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/3037/3037005.png",
                        width: 40,
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
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Login to your account',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              //email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: Colors.black45),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.5)),
                      ),
                      fillColor: Colors.white.withOpacity(0.2),
                      filled: true,
                      prefixIcon: Icon(Icons.email, color: Colors.black45),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey[600])),
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: Colors.black45),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.5)),
                      ),
                      fillColor: Colors.white.withOpacity(0.2),
                      filled: true,
                      prefixIcon: Icon(Icons.lock, color: Colors.black45),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[600])),
                ),
              ),

              const SizedBox(
                height: 6,
              ),

              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //Sign in Buntton
              GestureDetector(
                onTap: signUserIn,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                      child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              //google
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[400]),
                      child: const Icon(
                        Icons.mail_outline_rounded,
                        size: 30,
                      ),
                      height: 70),
                ],
              ),

              const SizedBox(
                height: 16,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  SizedBox(
                    width: 4,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                  // Original
                  // Text(
                  //   'Register now',
                  //   style: TextStyle(
                  //       color: Colors.amber,
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
