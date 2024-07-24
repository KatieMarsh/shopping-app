import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  // Declaring class variable
  XFile? file;
  UploadTask? uploadTask;
  ImagePicker imagePicker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _tcName = TextEditingController();
  final _tcPrice = TextEditingController();
  String? _url;
  String? warning;

  // function that let you pick an image from gallery
  Future selectFile() async {
    final result = await imagePicker.pickImage(source: ImageSource.gallery);
    if (result == null) return;
    setState(() {
      file = result;
    });
  }

  // Upload the imgage to FireBase storage
  Future uploadFile() async {
    // Name the file with time to the milisecond
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = 'images/$uniqueFileName';
    final fileToUpload = File(file!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(fileToUpload);

    final snapshot = await uploadTask!.whenComplete(() {});

    _url = await snapshot.ref.getDownloadURL();
    print("Download Link: $_url");
    print(_tcPrice.text);
    String price = _tcPrice.text;
    print(price);
  }

  // Uploading the data to FireBase DB
  Future addCollectionToFireBase(String name, int price) async {
    await uploadFile();
    var data = {
      'name': name,
      'price': price,
      'image': _url,
    };
    FirebaseFirestore.instance.collection('products').add(data).then(
          (value) => print('Adding done!'),
          onError: (e) => print('Error $e'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: const Text('Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (file != null)
              Expanded(
                  flex: 20,
                  child: Container(
                    child: Image.file(
                      File(file!.path),
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  )),
            if (file == null)
              Container(
                  width: 100,
                  height: 100,
                  child: IconButton(
                      onPressed: () {
                        selectFile();
                      },
                      icon: Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 50,
                      ))),
            Expanded(
              flex: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _tcName,
                        decoration: const InputDecoration(
                          hintText: 'Product name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Name for your product';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _tcPrice,
                        decoration: const InputDecoration(
                          hintText: 'Product price',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a price';
                          } else if (int.tryParse(value) == null) {
                            return 'Please input only number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () async {
                                setState(() {
                                  file = null;
                                });
                              },
                              child: Text("Clear picture"))),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    file != null) {
                                  String name = _tcName.text;
                                  int price = int.parse(_tcPrice.text.trim());
                                  addCollectionToFireBase(name, price);
                                  // Snackbar
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Uploaded'),
                                  ));
                                  // Remove everything
                                  setState(() {
                                    file = null;
                                    warning = null;
                                    _tcName.clear();
                                    _tcPrice.clear();
                                  });
                                } else {
                                  setState(() {
                                    warning = "Make sure an image is selected";
                                  });
                                }
                              },
                              child: Text("Upload"))),
                      SizedBox(
                        height: 10,
                      ),
                      if (warning != null)
                        Text(
                          warning!,
                          style: TextStyle(color: Colors.red),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
