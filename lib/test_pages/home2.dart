import 'package:final_project/test/test_product_detail.dart';
import 'package:final_project/test_pages/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int _startRefresh = 0;
  final screen = [];
  List<Map> _items = [];
  final _userStream =
      FirebaseFirestore.instance.collection('products').snapshots();
  final _tcSerach = TextEditingController();
  dynamic id;
  List<String> _choices = [
    'MFU',
    'Lamduan dormitory',
    'F dormitory',
    'Dormitory near MFU'
  ];
  List<String> _selectedChoices = [
    'MFU',
    'Lamduan dormitory',
    'F dormitory',
    'Dormitory near MFU'
  ];

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

  Future<void> _selectCategory() async {
    String? answer = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          title: const Text('Location filter'),
          actions: [
            CheckBoxList(choices: _choices, selectedChoices: _selectedChoices),
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
    if (answer == 'OK') {
      _runCategoryFilter(_selectedChoices);
    }
  }

  void _runCategoryFilter(List<String> category) {
    List<Map<dynamic, dynamic>> results = [];
    if (category.isEmpty) {
    } else {
      results = _items
          .where((context) => category.contains(context['owner_sell_place']))
          .toList();
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

  void start() {
    if (_startRefresh == 0) {
      _startRefresh = 1;
      refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Image display test'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(200),
              ),
              child: TextField(
                controller: _tcSerach,
                onChanged: (value) => _runFilter(value),
                //   decoration: InputDecoration(
                //       labelText: 'Search', suffixIcon: Icon(Icons.search)),
                // ),
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  suffixIcon: IconButton(
                      onPressed: () {
                        _selectCategory();
                      },
                      icon: Icon(Icons.filter_alt)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search',
                ),
              ),
            ),
            SizedBox(
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
                  start();
                  // Pull down to refresh
                  return RefreshIndicator(
                    onRefresh: refresh,
                    child: ListView.builder(
                      itemCount: _foundItems.length,
                      itemBuilder: (context, index) {
                        // Get the items at this index
                        Map thisItem = _foundItems[index];
                        // Return the widget for the list items
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[800],
                            ),
                            child: Center(
                              child: ListTile(
                                textColor: Colors.white,
                                selectedColor: Colors.grey,
                                // leading:
                                //     // Container(
                                //     //   width: 100,
                                //     //   height: 100,
                                //     Container(
                                //   height: 170,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(30),
                                //     color: Colors.black,
                                //   ),
                                //   child: thisItem.containsKey('image')
                                //       ? Image.network(
                                //           "${thisItem['image']}",
                                //           fit: BoxFit.fitWidth,
                                //         )
                                //       : Container(),
                                // ),
                                leading: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white),
                                  child: ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(30),
                                      child: Image.network(
                                        "${thisItem['image']}",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  thisItem['name'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  "฿${thisItem['price']}",
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: SizedBox(
                                  height: 50,
                                  width: 60,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (thisItem['sold'] == true)
                                        const Text(
                                          'SOLD',
                                          style: TextStyle(
                                              fontSize: 16,
                                              letterSpacing: 1.2,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                    ],
                                  ),
                                ),

                                onTap: () async {
                                  // thisItem.addAll({id: data[index].id});
                                  if (data.isNotEmpty)
                                    thisItem['id'] = data[index].id;
                                  print(thisItem);
                                  int refreshNeeded = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              TestProductDetail()),
                                          settings: RouteSettings(
                                              arguments: thisItem)));
                                  if (refreshNeeded == 1) {
                                    refresh();
                                  }
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
            // SizedBox(
            //   height: 36,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18),
            //   child: Container(
            //     padding: EdgeInsets.all(4),
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(20)),
            //     child: Icon(Icons.favorite_border),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
