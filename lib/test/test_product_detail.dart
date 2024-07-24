import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:phone_number/phone_number.dart';

class TestProductDetail extends StatefulWidget {
  const TestProductDetail({super.key});

  @override
  State<TestProductDetail> createState() => _TestProductDetailState();
}

class _TestProductDetailState extends State<TestProductDetail> {
  final user = FirebaseAuth.instance.currentUser!;
  final _tcName = TextEditingController();
  final _tcPrice = TextEditingController();
  final _tcDetails = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final primaryColor = Colors.grey[900];

  // Define a validator function for the phone number input field
  // String? _validatePhoneNumber(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter a phone number';
  //   }

  // Use the PhoneNumber package to validate the phone number
  //   final phoneNumber = PhoneNumber(value, countryCode: 'th');
  //   if (!phoneNumber.isValid()) {
  //     return 'Please enter a valid phone number';
  //   }

  //   return null;
  // }

  // Show buyer's detail
  showBuyerDetail(Map data) async {
    String docId = data['id'];
    String? answer = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text('Buyer detail'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Phone number : ${data['buyer_phone']}",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Email : ${data['buyer_email']}",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop('OK');
                },
                child: const Text("Reject order"),
              ),
            ],
          );
        });
    // update data
    if (answer == 'OK') {
      String details = _tcDetails.text;

      var data = {'buyer_phone': null, 'buyer_email': null, 'sold': false};
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      await FirebaseFirestore.instance
          .collection('products')
          .doc(docId)
          .update(data)
          .then(
            (value) => print('Updating done!'),
            onError: (e) => print('Error $e'),
          );
      //pop the loading
      Navigator.of(context).pop();
      //pop the page
      Navigator.pop(context, 1);
    }
  }

  // Cancal the order
  cancelOrder(Map data) async {
    String docId = data['id'];
    String? answer = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text('Are you sure you want to cancel order?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop('OK');
                },
                child: const Text("Cancel order"),
              ),
            ],
          );
        });
    // update data
    if (answer == 'OK') {
      String details = _tcDetails.text;

      var data = {'buyer_phone': null, 'buyer_email': null, 'sold': false};
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      await FirebaseFirestore.instance
          .collection('products')
          .doc(docId)
          .update(data)
          .then(
            (value) => print('Updating done!'),
            onError: (e) => print('Error $e'),
          );
      //pop the loading
      Navigator.of(context).pop();
      //pop the page
      Navigator.pop(context, 1);
    }
  }

  // Delete data
  Future<void> deleteData(String docId) async {
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          title: Text('Are you sure you want to delete this data?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('OK');
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );

    // delete data
    if (answer == 'OK') {
      // print('OK');
      // show loading
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      await FirebaseFirestore.instance
          .collection('products')
          .doc(docId)
          .delete()
          .then(
            (value) => print('Delete done!'),
            onError: (e) => print('Error $e'),
          );
      //pop the loading
      Navigator.of(context).pop();
      //pop the page
      Navigator.pop(context, 1);
    }
  }

  // Editing the data
  editData(String docId) async {
    _tcName.text = '';
    _tcPrice.text = '';
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          title: const Text('Edit product data'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  maxLength: 60,
                  controller: _tcName,
                  decoration: const InputDecoration(
                    hintText: 'Product name',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Name for your product';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 9,
                  controller: _tcPrice,
                  decoration: const InputDecoration(
                    hintText: 'Price (Thai Baht ฿ and no decimal point)',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    } else if (int.tryParse(value) == null) {
                      return 'Please input only number with no decimal point';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 250,
                  controller: _tcDetails,
                  decoration: const InputDecoration(
                    hintText: 'Details',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter details of the product';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop('OK');
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );

    // update data
    if (answer == 'OK') {
      String name = _tcName.text;
      int price = int.parse(_tcPrice.text);
      String details = _tcDetails.text;
      var data = {'name': name, 'price': price, 'detail': details};
      // show the loading
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      await FirebaseFirestore.instance
          .collection('products')
          .doc(docId)
          .update(data)
          .then(
            (value) => print('Updating done!'),
            onError: (e) => print('Error $e'),
          );
      // pop the loading
      Navigator.of(context).pop();
      Navigator.pop(context, 1);
    }
  }

  // Buying the product
  buyProduct(Map data) async {
    String docId = data['id'];
    _tcName.text = '';
    _tcPrice.text = '';
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          title: const Text('Leave contact info'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Product : ${data['name']}"),
                Text("Price : ${data['price']}"),
                TextFormField(
                  maxLength: 10,
                  controller: _tcDetails,
                  decoration: const InputDecoration(
                    hintText: 'Your Thai Phone Number',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    } else if (int.tryParse(value) == null) {
                      return 'Please input only phone number';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop('OK');
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );

    // update data to notify owner
    if (answer == 'OK') {
      String details = _tcDetails.text;

      var data = {
        'buyer_phone': details,
        'buyer_email': user.email,
        'sold': true
      };
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      await FirebaseFirestore.instance
          .collection('products')
          .doc(docId)
          .update(data)
          .then(
            (value) => print('Updating done!'),
            onError: (e) => print('Error $e'),
          );
      Navigator.of(context).pop();
      Navigator.pop(context, 1);
    }
  }

  // Report a product
  reportProduct(Map data) async {
    String docId = data['id'];
    _tcName.text = '';
    _tcPrice.text = '';
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          title: const Text('Leave contact info'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Product : ${data['name']}"),
                Text("Price : ${data['price']}"),
                TextFormField(
                  maxLength: 10,
                  controller: _tcDetails,
                  decoration: const InputDecoration(
                    hintText: 'Your Thai Phone Number',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    } else if (int.tryParse(value) == null) {
                      return 'Please input only phone number';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop('OK');
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );

    // update data to notify owner
    if (answer == 'OK') {
      String details = _tcDetails.text;

      var data = {
        'buyer_phone': details,
        'buyer_email': user.email,
        'sold': true
      };
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      await FirebaseFirestore.instance
          .collection('products')
          .doc(docId)
          .update(data)
          .then(
            (value) => print('Updating done!'),
            onError: (e) => print('Error $e'),
          );
      Navigator.of(context).pop();
      Navigator.pop(context, 1);
    }
  }

  // Notify owner
  Future<void> notify(Map data) async {
    String docId = data['id'];
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          title: Text('Notify owner'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  maxLength: 50,
                  controller: _tcDetails,
                  decoration: const InputDecoration(
                    hintText: 'note',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a note';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('OK');
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );

    // delete data
    if (answer == 'OK') {
      String details = _tcDetails.text;
      var data = {
        'admin_note': details,
      };
      // print('OK');
      // show loading
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      await FirebaseFirestore.instance
          .collection('products')
          .doc(docId)
          .update(data)
          .then(
            (value) => print('Updating done!'),
            onError: (e) => print('Error $e'),
          );
      //pop the loading
      Navigator.of(context).pop();
      //pop the page
      Navigator.pop(context, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: true);
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    print(data);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: const Text('Product'),
        ),
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 5,
                color: primaryColor,
              ),
              //ต้นฉบับ
              // Expanded(
              //   flex: 5,
              //   child: Container(
              //     color: primaryColor,
              //     child: Container(
              //       decoration: const BoxDecoration(
              //           shape: BoxShape.rectangle,
              //           color: Colors.white,
              //           borderRadius: BorderRadius.all(Radius.circular(20))),
              //       child: Image.network("${data['image']} ",
              //           fit: BoxFit.scaleDown,
              //           filterQuality: FilterQuality.high),
              //     ),
              //   ),
              // ),

              //ลองทำเองเพิ่มรูปภาพมากกว่า1
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Container(
                        color: primaryColor,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Image.network("${data['image']} ",
                              fit: BoxFit.scaleDown,
                              filterQuality: FilterQuality.high),
                        ),
                      ),
                      if (data['image2'] != null)
                        Container(
                          color: primaryColor,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Image.network("${data['image2']} ",
                                fit: BoxFit.scaleDown,
                                filterQuality: FilterQuality.high),
                          ),
                        ),
                      if (data['image3'] != null)
                        Container(
                          color: primaryColor,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Image.network("${data['image3']} ",
                                fit: BoxFit.scaleDown,
                                filterQuality: FilterQuality.high),
                          ),
                        ),
                      if (data['image4'] != null)
                        Container(
                          color: primaryColor,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Image.network("${data['image4']} ",
                                fit: BoxFit.scaleDown,
                                filterQuality: FilterQuality.high),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //solve
                        Text(
                          "${data['name']}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                                // "PRICE: ${data['price'].toString()} Baht",
                                "฿${data['price'].toString()}",
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            Text("${data['owner_sell_place']}",
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${data['detail']}",
                          style: TextStyle(color: Colors.grey[300]),
                        ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        // Text(
                        //   "PRICE: ${data['price'].toString()} Baht",
                        // ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (data['owner_email'] != null)
                                if (data['owner_email'] == user.email)
                                  if (data['sold'] == true)
                                    IconButton(
                                      onPressed: () async {
                                        await showBuyerDetail(data);
                                      },
                                      icon: const Icon(
                                        Icons.monetization_on,
                                        size: 20,
                                        color: Colors.yellow,
                                      ),
                                    ),
                              if (data['owner_email'] != null)
                                if (data['owner_email'] == user.email ||
                                    provider.isAdmin(user.email!))
                                  IconButton(
                                    onPressed: () async {
                                      await deleteData(data['id']);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                              if (data['owner_email'] != null)
                                if (data['owner_email'] != user.email)
                                  IconButton(
                                      onPressed: () async {},
                                      icon: const Icon(
                                        Icons.report,
                                        size: 20,
                                        color: Colors.red,
                                      )),
                              if (data['owner_email'] != null)
                                if (data['owner_email'] != user.email)
                                  if (data['sold'] == false ||
                                      data['sold'] == null)
                                    SizedBox(
                                      width: 150,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.amber),
                                        onPressed: () {
                                          buyProduct(data);
                                        },
                                        child: const Text(
                                          'Buy',
                                          style: TextStyle(
                                              fontSize: 20,
                                              letterSpacing: 1.2,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                              if (data['owner_email'] != null)
                                if (data['owner_email'] != user.email)
                                  if (data['sold'] == true)
                                    if (data['buyer_email'] != user.email)
                                      SizedBox(
                                        width: 150,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red),
                                          onPressed: () {},
                                          child: const Text(
                                            'SOLD',
                                            style: TextStyle(
                                                fontSize: 20,
                                                letterSpacing: 1.2,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                              if (data['owner_email'] != null)
                                if (data['owner_email'] != user.email)
                                  if (data['sold'] == true)
                                    if (data['buyer_email'] == user.email)
                                      SizedBox(
                                        width: 160,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red),
                                          onPressed: () {
                                            cancelOrder(data);
                                          },
                                          child: const Text(
                                            'Cancel Order',
                                            style: TextStyle(
                                                fontSize: 20,
                                                letterSpacing: 1.2,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                              if (data['owner_email'] != null)
                                if (data['owner_email'] == user.email)
                                  SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.amber),
                                      onPressed: () {
                                        editData(data['id']);
                                        _tcName.text = data['name'];
                                        _tcPrice.text =
                                            data['price'].toString();
                                        _tcDetails.text = data['detail'];
                                      },
                                      child: const Text(
                                        'Edit',
                                        style: TextStyle(
                                            fontSize: 20,
                                            letterSpacing: 1.2,
                                            color: Colors.white),
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
            ],
          ),
        ),
      ),
    );
  }
}
