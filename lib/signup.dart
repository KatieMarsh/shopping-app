import 'package:final_project/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController tcName = TextEditingController();
  TextEditingController tcEmail = TextEditingController();
  TextEditingController tcPassword = TextEditingController();
  TextEditingController tcPassword2 = TextEditingController();
  TextEditingController tcPhone = TextEditingController();
  TextEditingController tcAddress = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 150,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                // Name field
                TextFormField(
                  controller: tcName,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // Email field
                TextFormField(
                  controller: tcEmail,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // Password field
                TextFormField(
                  controller: tcPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // Password again field
                TextFormField(
                  controller: tcPassword2,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Confirm password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value != tcPassword.text) {
                      return 'Passwords did not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // Phone field
                TextFormField(
                  controller: tcPhone,
                  decoration: const InputDecoration(
                    hintText: 'Phone number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // if(value!.isEmpty){
                      return 'Please enter Phone number';
                    } else if (int.tryParse(value) == null) {
                      return 'Please input only number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // Address field
                TextField(
                  controller: tcAddress,
                  decoration: const InputDecoration(
                    hintText: 'Address',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                // SIGN UP button

                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // print('validated');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Registered'),
                        ));
                      }
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20, letterSpacing: 1.2),
                    ),
                  ),
                ),
                // Bottom part
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
