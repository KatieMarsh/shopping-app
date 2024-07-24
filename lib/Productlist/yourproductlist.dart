import 'package:flutter/material.dart';

class YourProductList extends StatelessWidget {
  const YourProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey[800],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          //item image
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(12),
          //   child: Image.asset(
          //     'assets\images\item1.png',
          //   ),
          // ),

          //item name
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(height: 4,),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey),
                ),
              ],
            ),
          ),

          //pric
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              child:
                Text('Price',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),              
            ),            
          ),
        ],),
      ),      
    );    
  }
}