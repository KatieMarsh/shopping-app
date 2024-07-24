import 'package:flutter/material.dart';

class Catagory extends StatelessWidget {
  // final String CatagoryImagePath;
  final String catagoryName;

  Catagory ({
    // required this.CatagoryImagePath,
    required this.catagoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                //item images
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(12),
                //   child: Image.asset(
                //     'assets\images\item1.png',
                //   ),
                // ),

                //item name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,            
                    children: [
                      Column(                
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            catagoryName,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.amber),
                          ),
                        ],                  
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),      
    );    
  }
}