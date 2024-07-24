import 'package:flutter/material.dart';

class Orderstatus extends StatefulWidget {
  const Orderstatus({Key? key}) : super(key: key);

  @override
  _OrderstatusState createState() => _OrderstatusState();
}

class _OrderstatusState extends State<Orderstatus> {
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
        child: Container(
          //image
          color: Colors.black,
          width: double.infinity,
          height: 150,
          child: 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //name
                  const Text('bag', 
                  style: TextStyle(
                  fontSize: 20)),
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
            ),
          
        ),
      );
}
