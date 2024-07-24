import 'package:final_project/test/test_product_detail.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final screen = [];
  List<Map> _items = [];
  final _userStream =
      FirebaseFirestore.instance.collection('products').snapshots();
  final _tcSerach = TextEditingController();

  // Search bar
  void _runFilter(String enteredKeyword) {
    List<Map<dynamic, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _items;
    } else {
      results = _items
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundItems = results;
    });
  }

  List<Map<dynamic, dynamic>> _foundItems = [];
  @override
  void initState() {
    _foundItems = _items;
    super.initState();
  }

  Future refresh() async {
    setState(() {
      _foundItems = _items;
      _tcSerach.clear();
    });
  }

  Future<void> deleteData(String docId) async {
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
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
      await FirebaseFirestore.instance
          .collection('products')
          .doc(docId)
          .delete()
          .then(
            (value) => print('Delete done!'),
            onError: (e) => print('Error $e'),
          );
      await refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image display test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _tcSerach,
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  hintText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            // use expanded so the rest of the page will warp around the top part
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _userStream,
                builder: ((context, snapshot) {
                  // connection error or not
                  if (snapshot.hasError) {
                    return const Text("Connection error");
                  }

                  // connecting or not
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading data...');
                  }
                  // data ready
                  // convert data to list
                  var data = snapshot.data!.docs;

                  //Convert the documents to Maps
                  _items = data.map((e) => e.data() as Map).toList();
                  // Pull down to refresh
                  return RefreshIndicator(
                    onRefresh: refresh,
                    child: ListView.builder(
                      itemCount: _foundItems.length,
                      itemBuilder: (context, index) {
                        // Get the items at this index
                        Map thisItem = _foundItems[index];
                        // Return the widget for the list items
                        return ListTile(
                          key: ValueKey(data[index].id),
                          textColor: Colors.white,
                          selectedColor: Colors.grey,
                          leading: Container(
                            width: 100,
                            height: 100,
                            child: thisItem.containsKey('image')
                                ? Image.network("${thisItem['image']}")
                                : Container(),
                          ),
                          title: Text(thisItem['name']),
                          subtitle: Text("${thisItem['price']} Baht"),
                          trailing: IconButton(
                              onPressed: () async {
                                deleteData(data[index].id);
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.red,
                              )),
                          //_restaurants['data']['data'].forEach((key, value) => _restaurantList.add(value));
                          onTap: () {
                            // thisItem.addAll({'id': data[index].id});
                            // print(thisItem);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => TestProductDetail()),
                                  settings: RouteSettings(arguments: thisItem)),
                            );
                          },
                          onLongPress: () {},
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
