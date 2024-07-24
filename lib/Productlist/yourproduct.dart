import 'package:flutter/material.dart';
import 'package:final_project/Productlist/yourproductlist.dart';

class YourProduct extends StatefulWidget {
  const YourProduct({super.key});

  @override
  State<YourProduct> createState() => _YourProductState();
}

class _YourProductState extends State<YourProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: const Text(
          'Your Product',
        ),
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // YourProductList(),
            ],
          ),
        ),
      ),
    );
  }
}


// class YourProduct extends StatefulWidget {
//   const YourProduct({super.key});

//   @override
//   State<YourProduct> createState() => _YourProductState();
// }

// class _YourProductState extends State<YourProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.grey,
//         title: const Text('Your Product',),
//       ),
//       backgroundColor: Colors.grey,
//       body: SingleChildScrollView(
//         child: Container(
//           child: Container(
//             child: Container(
//               padding:
//                   EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//               height: MediaQuery.of(context).size.height,
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: 7,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Container(
//                           height: MediaQuery.of(context).size.width * 0.3,
//                           child: Card(
//                             color: Colors.grey[800],
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             elevation: 5,
//                             child: Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [

//                                 //item image
//                                 // ClipRRect(
//                                 //   borderRadius: BorderRadius.circular(12),
//                                 //   child: Image.asset(
//                                 //     'assets\images\item1.png',
//                                 //   ),
//                                 // ),

//                                 //item name
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Product',
//                                         style: TextStyle(
//                                           fontSize: 20,
//                                           color: Colors.amber,
//                                         ),
//                                       ),
//                                       SizedBox(height: 4,),
//                                       Text(
//                                         'Description',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.grey),
//                                       ),
//                                     ],
//                                   ),
//                                 ),

//                                 //pric
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 18),
//                                   child: Container(
//                                     child:
//                                       Text('Price',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),              
//                                   ),            
//                                 ),
//                               ],
//                             ),
//                             ),
//                           ),
//                         ),
//                       ),                          
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }