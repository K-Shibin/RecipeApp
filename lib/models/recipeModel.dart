import 'package:flutter/foundation.dart'; // for Uint8List

class Recipe {
  String name;
  Uint8List image;
  String ingredients;
  String instructions;
  String category;

  Recipe({
    required this.name,
    required this.image,
    required this.ingredients,
    required this.instructions,
    required this.category,
  });

  // Convert a Recipe object to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'ingredients': ingredients,
      'instructions': instructions,
      'category': category,
    };
  }

  // Create a Recipe object from JSON (Map<String, dynamic>)
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      image: Uint8List.fromList(List<int>.from(json['image'])),
      ingredients: json['ingredients'],
      instructions: json['instructions'],
      category: json['category'],
    );
  }
}
