import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:recipe_app_sqflite/controller/controller.dart';
import 'package:recipe_app_sqflite/database/dbase.dart';
import 'package:recipe_app_sqflite/models/recipeModel.dart';

import 'homePage.dart';

class AddPage extends StatefulWidget {
   AddPage({super.key,required this.category});

  String category;



  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  final TextEditingController _recipeNameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: const Text('ADD'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[800],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image and IconButton
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage:
                    _image != null ? FileImage(File(_image!.path)) : null,
                    backgroundColor: Colors.grey[300],
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      color: Colors.white,
                      onPressed: _pickImage,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), // Added more space here

            // Recipe Name Text Field
            TextFormField(
              controller: _recipeNameController,
              decoration: InputDecoration(
                labelText: 'Recipe Name',
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.blueGrey[500],
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Ingredients Text Form Field
            TextFormField(
              controller: _ingredientsController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Ingredients',
                labelStyle: const TextStyle(color: Colors.white),
                hintText: 'Enter ingredients ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.blueGrey[500],
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Instructions Text Form Field
            TextFormField(
              controller: _instructionsController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Instructions',
                labelStyle: const TextStyle(color: Colors.white),
                hintText: 'Enter instructions ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.blueGrey[500],
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 40), // Added space before Save button

            // Save Button
            ElevatedButton(
              onPressed: () async {
                // Ensure all required fields are filled in
                if (_recipeNameController.text.isEmpty ||
                    _ingredientsController.text.isEmpty ||
                    _instructionsController.text.isEmpty ||
                    _image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields and select an image')),
                  );
                  return;
                }

                // Convert image file to Uint8List
                Uint8List imageBytes = await File(_image!.path).readAsBytes();

                // Create the Recipe object
                Recipe recipe = Recipe(
                  name: _recipeNameController.text,
                  image: imageBytes,  // Pass the Uint8List image
                  ingredients: _ingredientsController.text,
                  instructions: _instructionsController.text,
                  category: widget.category,
                );

                // Insert the Recipe into the database
                await Dbservice().insertItem(recipe);

                // Navigate to the RecipeDetailPage with the saved recipe
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.blueGrey[500],
              ),
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 18, color: Colors.white54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _recipeNameController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }
}
