//import 'package:final_project/login.dart';
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
                    flex: 2,
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
                  Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://cdn.icon-icons.com/icons2/1875/PNG/512/additem_120286.png",
                          )
                        ],
                      )),
                  // Product Name field
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
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
                            height: 15,
                          ),
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
                            height: 15,
                          ),
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
                        ],
                      )),

                  // Details field
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // print('validated');
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Registered'),
                                  ));
                                }
                              },
                              child: const Text(
                                'Confirm',
                                style:
                                    TextStyle(fontSize: 20, letterSpacing: 1.2),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home), 
                label: 'home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.upload), 
                label: 'Upload'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person), 
                label: 'me'),
            ],
            // currentIndex: currentIndex,
            // onTap: (index) => setState(() => currentIndex = index),
          ),
    ));
        //);
  }
}
