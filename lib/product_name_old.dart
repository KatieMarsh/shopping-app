import 'package:final_project/login.dart';
import 'package:flutter/material.dart';

class ProductNames extends StatefulWidget {
  const ProductNames({super.key});

  @override
  State<ProductNames> createState() => _ProductNamesState();
}

class _ProductNamesState extends State<ProductNames> {
  TextEditingController tcProductname = TextEditingController();
  TextEditingController tcPrice = TextEditingController();
  TextEditingController tcDetails = TextEditingController();
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
            backgroundColor: Colors.transparent,
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
                            'Product name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // Product Name field
                    TextField(
                      controller: tcProductname,
                      decoration: const InputDecoration(
                        hintText: 'Product name',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Price field
                    TextField(
                      controller: tcPrice,
                      decoration: const InputDecoration(
                        hintText: 'Price',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Details field
                    TextFormField(
                      controller: tcDetails,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Details',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 32, 158, 187),
                        fixedSize: const Size.fromWidth(300),
                        shape: const StadiumBorder(side: BorderSide.none),
                        padding: const EdgeInsets.all(12),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // print('validated');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Registered'),
                          ));
                        }
                      },
                      child: const Text(
                        'Confirm',
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
