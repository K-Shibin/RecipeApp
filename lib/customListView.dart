import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;

  CustomCard({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, //
     // Fixed width for each item
      margin: EdgeInsets.symmetric(horizontal: 8), // Space between items
      child: Card(
        color: Colors.blueGrey[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(100), // Rounded top corners
            bottom: Radius.circular(20), // Rounded bottom corners
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage(imagePath), // Use backgroundImage instead of child
              ),
            ),
            SizedBox(height: 30),
            Text(
              title,
              style: TextStyle(color: Color(0xFFC96508),fontSize: 19),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
