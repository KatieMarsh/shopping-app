import 'package:flutter/material.dart';

class Table1 extends StatelessWidget {
  const Table1({super.key});

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
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // https://icons.iconarchive.com/icons/diversity-avatars/avatars/256/batman-icon.png
                Center(
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://icons.iconarchive.com/icons/diversity-avatars/avatars/256/batman-icon.png'),
                    radius: 40,
                  ),
                ),
                Divider(
                  color: Colors.grey[400],
                  height: 40,
                ),
                Text(
                  'Table',
                  style: TextStyle(color: Colors.grey[300], fontSize: 18),
                ),
                Text(
                  '',
                  style: TextStyle(color: Colors.yellow, fontSize: 26),
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'John-doe@abc.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
