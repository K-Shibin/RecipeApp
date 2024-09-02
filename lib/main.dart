import 'package:flutter/material.dart';
import 'package:recipe_app_sqflite/registrationPage.dart';
import 'package:recipe_app_sqflite/viewDetails.dart';

import 'database/dbase.dart';
import 'add.dart';
import 'homePage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Dbservice().initialization();
  runApp(MaterialApp(
    home: RegistrationPage(),
  ));
}