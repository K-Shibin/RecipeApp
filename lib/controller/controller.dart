import 'dart:io';
import 'dart:typed_data';

import 'package:recipe_app_sqflite/models/recipeModel.dart';

import '../database/dbase.dart';

class Controller {
  Dbservice db = Dbservice();

  static List<Map<String, dynamic>> items = [];

  void additem(Recipe recipe) {
    db.insertItem(recipe);
  }


}
