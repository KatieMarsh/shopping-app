import 'package:flutter/material.dart';

class ItemTil extends StatelessWidget {
  // final String itemImagePath;
  final String itemName;
  final String itemPrice;

  ItemTil({
    // required this.itemImagePath, 
    required this.itemName,
    required this.itemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 100,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
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
                  itemName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(height: 4,),
                Text(
                  'Small table',
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
                Text('\฿ '+ itemPrice,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),              
            ),            
          ),
          SizedBox(height: 36,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Icon(Icons.favorite_border),
            ),
          ),
        ],),
      ),      
    );    
  }
}