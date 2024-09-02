import 'package:path/path.dart';
import 'package:recipe_app_sqflite/models/recipeModel.dart';
import 'package:sqflite/sqflite.dart';

class Dbservice {
  static Database? database;

  Future<void> initialization() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    database = await openDatabase(path, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE recipetable(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT ,image BLOB, ingredients TEXT ,instructions TEXT , category TEXT)');
    }, version: 1);
    print('Database initialized');
  }

  //add

  Future<void> insertItem(Recipe recipe) async {
    int a = await database!.insert('recipetable', recipe.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(a);
    print('dfghj');
  }

  Future<List<Recipe>> getitem() async {
    List<Map<String, dynamic>> data = await database!.query('recipetable');

    List<Recipe> recipes = data.map((e) => Recipe.fromJson(e)).toList();

    print(recipes);
    print('object');
    return recipes;
  }
}
