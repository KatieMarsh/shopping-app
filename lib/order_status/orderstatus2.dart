import 'package:flutter/material.dart';

class Orderstatus2 extends StatefulWidget {
  const Orderstatus2({Key? key}) : super(key: key);

  @override
  _Orderstatus2State createState() => _Orderstatus2State();
}

class _Orderstatus2State extends State<Orderstatus2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 12);
          },
          itemBuilder: (context, index) {
            return order(index);
          },
        ),
      ),
    );
  }

  Widget order(int index) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Container(
                //image
                color: Colors.black,
                width: double.infinity,
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            //image
                            color: Colors.white,
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              //name
                              const Text('bag', style: TextStyle(fontSize: 20)),
                              const Spacer(),
                              ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      //Navigator.push(context, MaterialPageRoute(builder: TestProductDetail()))
                                    });
                                  },
                                  icon: const Icon(Icons.shopping_basket_sharp),
                                  label: const Text('Check'))
                            ],
                          ),
                        ))
                  ],
                )),
          ],
        ),
      );
}
