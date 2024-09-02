import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        title: const Text('RECIPE NAME'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey.shade700,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(29.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Set the border radius
              child: Container(
                child: Image.asset(
                  'assets/images/food_Recipe1.jpg', // Add your image URL here
                  fit: BoxFit.cover, // Ensures the image fits inside the container
                  height: 200,
                  width: double.infinity,
                ),
              ),
            ),


          ),
          SizedBox(height: 15,),
          Text('PANCAKES'),
          SizedBox(height: 16,),
          Text('INGREDIENTS'),
          SizedBox(height: 16,),
          Text('INSTRUCTIONS')
        ],
      ),
    );
  }
}
