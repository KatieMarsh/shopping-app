import 'package:flutter/material.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Discover',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    'Show all',
                    style: TextStyle(color: Colors.teal, fontSize: 15),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.teal,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 280,
                    child: Image(
                      image: NetworkImage(
                          'https://www.ikea.com/th/en/images/products/voxloev-dining-table-light-bamboo__0997396_pe822660_s5.jpg?f=s'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    height: 50,
                  ),
                  Text('Table1',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 280,
                    child: Image(
                      image: NetworkImage(
                          'https://cdn.shopify.com/s/files/1/2660/5202/products/che3rdtl_hc_1400x.jpg?v=1627659075'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    height: 40,
                  ),
                  Text('Table2',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble), label: 'chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'me'),
          ],
        ),
      ),
    );
  }
}
