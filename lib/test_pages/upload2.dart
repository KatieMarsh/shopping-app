import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
// Declaring class variable
  XFile? file;
  XFile? file2;
  XFile? file3;
  XFile? file4;

  UploadTask? uploadTask;
  UploadTask? uploadTask2;
  UploadTask? uploadTask3;
  UploadTask? uploadTask4;
  ImagePicker imagePicker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _tcName = TextEditingController();
  final _tcPrice = TextEditingController();
  final _tcDetails = TextEditingController();

  String? _url = null;
  String? _url2 = null;
  String? _url3 = null;
  String? _url4 = null;

  String? warning = null;
  int _price = 0;
  final user = FirebaseAuth.instance.currentUser!;
  List<String> items = [
    'MFU',
    'Lamduan dormitory',
    'F dormitory',
    'Dormitory near MFU'
  ];
  String? _selectedPlace = 'MFU';
  //ต้นฉบับ
  // function that let you pick an image from gallery
  // Future selectFile() async {
  //   final result = await imagePicker.pickImage(source: ImageSource.gallery);
  //   if (result == null) return;
  //   setState(() {
  //     file = result;
  //   });
  // }

  //ลองทำ
  Future selectFile() async {
    final result = await imagePicker.pickImage(source: ImageSource.gallery);
    if (result == null) return;
    setState(() {
      file = result;
    });
  }

  Future selectFile2() async {
    final result2 = await imagePicker.pickImage(source: ImageSource.gallery);
    if (result2 == null) return;
    setState(() {
      file2 = result2;
    });
  }

  Future selectFile3() async {
    final result3 = await imagePicker.pickImage(source: ImageSource.gallery);
    if (result3 == null) return;
    setState(() {
      file3 = result3;
    });
  }

  Future selectFile4() async {
    final result4 = await imagePicker.pickImage(source: ImageSource.gallery);
    if (result4 == null) return;
    setState(() {
      file4 = result4;
    });
  }

  // Upload the imgage to FireBase storage
  Future uploadFile() async {
    // Name the file with time to the milisecond
    //image1
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    uniqueFileName = '${uniqueFileName}file1';
    final path = 'images/$uniqueFileName';
    final fileToUpload = File(file!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(fileToUpload);

    final snapshot = await uploadTask!.whenComplete(() {});

    _url = await snapshot.ref.getDownloadURL();

    //image2
    String uniqueFileName2 = DateTime.now().millisecondsSinceEpoch.toString();
    uniqueFileName2 = '${uniqueFileName2}file2';
    final path2 = 'images/$uniqueFileName2';
    final fileToUpload2 = File(file2!.path);

    final ref2 = FirebaseStorage.instance.ref().child(path2);
    uploadTask2 = ref2.putFile(fileToUpload2);

    final snapshot2 = await uploadTask2!.whenComplete(() {});

    _url2 = await snapshot2.ref.getDownloadURL();

    //image3
    String uniqueFileName3 = DateTime.now().millisecondsSinceEpoch.toString();
    uniqueFileName3 = '${uniqueFileName3}file3';
    final path3 = 'images/$uniqueFileName3';
    final fileToUpload3 = File(file3!.path);

    final ref3 = FirebaseStorage.instance.ref().child(path3);
    uploadTask3 = ref3.putFile(fileToUpload3);

    final snapshot3 = await uploadTask3!.whenComplete(() {});

    _url3 = await snapshot3.ref.getDownloadURL();

    //image4
    String uniqueFileName4 = DateTime.now().millisecondsSinceEpoch.toString();
    uniqueFileName4 = '${uniqueFileName4}file4';
    final path4 = 'images/$uniqueFileName4';
    final fileToUpload4 = File(file4!.path);

    final ref4 = FirebaseStorage.instance.ref().child(path4);
    uploadTask4 = ref4.putFile(fileToUpload4);

    final snapshot4 = await uploadTask4!.whenComplete(() {});

    _url4 = await snapshot4.ref.getDownloadURL();

    print("Download Link: $_url");
    print(_tcPrice.text);
    String price = _tcPrice.text;
    print(price);

    //
  }

  // Uploading the data to FireBase DB
  Future addCollectionToFireBase(
      String name, int price, String detail, String userEmail) async {
    await uploadFile();
    var data = {
      'name': name,
      'price': price,
      'image': _url,
      'image2': _url2,
      'image3': _url3,
      'image4': _url4,
      'detail': detail,
      'owner_email': userEmail,
      'owner_sell_place': _selectedPlace,
    };
    FirebaseFirestore.instance.collection('products').add(data).then(
          (value) => print('Adding done!'),
          onError: (e) => print('Error $e'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Product to SELL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Expanded(
            //   flex: 1,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       SizedBox(
            //         height: 150,
            //         width: 20,
            //       ),
            //       Text(
            //         'Product to sell',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 40,
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              flex: 3,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (file != null)
                      Expanded(
                          flex: 20,
                          child: Image.file(
                            File(file!.path),
                            width: double.infinity,
                            fit: BoxFit.fitHeight,
                          )),
                    if (file == null)
                      Container(
                        child: IconButton(
                          onPressed: () {
                            selectFile();
                          },
                          icon: const Icon(
                            Icons.add_photo_alternate,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    SizedBox(
                      width: 20,
                    ),
                    if (file2 != null)
                      Expanded(
                        flex: 20,
                        child: Image.file(
                          File(file2!.path),
                          width: double.infinity,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    if (file2 == null)
                      Container(
                        child: IconButton(
                          onPressed: () {
                            selectFile2();
                          },
                          icon: const Icon(
                            Icons.add_photo_alternate,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    SizedBox(
                      width: 20,
                    ),
                    if (file3 != null)
                      Expanded(
                        flex: 20,
                        child: Image.file(
                          File(file3!.path),
                          width: double.infinity,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    if (file3 == null)
                      Container(
                        child: IconButton(
                          onPressed: () {
                            selectFile3();
                          },
                          icon: const Icon(
                            Icons.add_photo_alternate,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    SizedBox(
                      width: 20,
                    ),
                    if (file4 != null)
                      Expanded(
                        flex: 20,
                        child: Image.file(
                          File(file4!.path),
                          width: double.infinity,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    if (file4 == null)
                      Container(
                        child: IconButton(
                          onPressed: () {
                            selectFile4();
                          },
                          icon: const Icon(
                            Icons.add_photo_alternate,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                  ],
                ),
                onLongPress: () {
                  setState(() {
                    file = null;
                    file2 = null;
                    file3 = null;
                    file4 = null;
                  });
                },
              ),
            ),
            // Product Name field
            Expanded(
                flex: 10,
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      maxLength: 30,
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
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLength: 200,
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
                    SizedBox(
                      height: 55,
                      width: 300,
                      child: DropdownButtonFormField<String>(
                        dropdownColor: Colors.amber,
                        focusColor: Colors.amberAccent,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(width: 5, color: Colors.blue),
                          ),
                        ),
                        value: _selectedPlace,
                        items: items
                            .map(
                              (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item,
                                      style: TextStyle(fontSize: 15))),
                            )
                            .toList(),
                        onChanged: (item) =>
                            setState(() => _selectedPlace = item),
                      ),
                    ),
                  ]),
                )),

            // Details field
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 5,
                    // ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              file != null) {
                            String name = _tcName.text;
                            String detail = _tcDetails.text;
                            String userEmail = user.email!;
                            int price = int.parse(_tcPrice.text.trim());
                            // show loading
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                });
                            // adding data to collection
                            await addCollectionToFireBase(
                                name, price, detail, userEmail);
                            // pop loading circle
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Uploaded'),
                            ));
                            // Remove everything
                            setState(() {
                              file = null;
                              file2 = null;
                              file3 = null;
                              file4 = null;
                              warning = null;
                              _tcName.clear();
                              _tcPrice.clear();
                              _tcDetails.clear();
                            });
                          } else if (file == null &&
                              file2 == null &&
                              file3 == null &&
                              file4 == null) {
                            setState(() {
                              warning = "Make sure an image is selected";
                            });
                          } else {
                            setState(() {
                              warning = "";
                            });
                          }
                        },
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 1.2,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if (warning != null)
                      Text(
                        warning!,
                        style: TextStyle(color: Colors.red[800]),
                      ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
