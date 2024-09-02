import 'package:flutter/material.dart';
import 'package:recipe_app_sqflite/add.dart';
import 'package:recipe_app_sqflite/database/dbase.dart';
import 'controller/controller.dart';
import 'customContainerButton.dart';
import 'customListView.dart';
import 'models/recipeModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> items1 = [];
  List<Map<String, String>> items2 = [];
  List<Map<String, String>> items3 = [];
  List<Map<String, String>> items4 = [];

  void _navigateAndAddItem1(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPage(
          category: 'BreakFast',
        ),
      ),
    );

    if (result != null) {
      setState(() {
        // Add the new item to a specific category, for example:
        items1.add(result);
      });
    }
  }

  void _navigateAndAddItem2(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPage(
          category: 'Lunch',
        ),
      ),
    );

    if (result != null) {
      setState(() {
        // Add the new item to a specific category, for example:
        items2.add(result);
      });
    }
  }

  void _navigateAndAddItem3(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPage(
          category: 'Dinner',
        ),
      ),
    );

    if (result != null) {
      setState(() {
        // Add the new item to a specific category, for example:
        items3.add(result);
      });
    }
  }

  void _navigateAndAddItem4(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPage(
          category: 'Dessert',
        ),
      ),
    );

    if (result != null) {
      setState(() {
        // Add the new item to a specific category, for example:
        items4.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Recipe',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // Implement menu action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainerButton(
                  text: 'BREAK FAST',
                  onPressed: () {
                    _navigateAndAddItem1(context);
                  }),
              SizedBox(height: 15),
              SizedBox(
                height: 250,
                child: FutureBuilder(
                    future: Dbservice().getitem(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Recipe>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child:
                                CircularProgressIndicator()); // Show loading indicator while waiting
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error: ${snapshot.error}')); // Show error if there's one
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                            child:
                                Text('No data available')); // Handle empty data
                      } else {
                        // When data is available, display the list of recipes
                        List<Recipe> recipes = snapshot.data!;

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recipes.length,
                          itemBuilder: (context, index) {
                            final item = recipes[index];
                            return CustomCard(
                              imagePath: item.name,
                              title: item.name,
                            );
                          },
                        );
                      }
                    }),
              ),
              SizedBox(height: 30),
              CustomContainerButton(
                text: 'LUNCH',
                onPressed: () {},
              ),
              SizedBox(height: 7),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items2.length,
                  itemBuilder: (context, index) {
                    final item = items2[index];
                    return CustomCard(
                      imagePath: item['image']!,
                      title: item['title']!,
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              CustomContainerButton(
                text: 'DINNER',
                onPressed: () {
                  _navigateAndAddItem3(context);
                },
              ),
              SizedBox(height: 7),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items3.length,
                  itemBuilder: (context, index) {
                    final item = items3[index];
                    return CustomCard(
                      imagePath: item['image']!,
                      title: item['title']!,
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              CustomContainerButton(
                text: 'DESSERT',
                onPressed: () {
                  _navigateAndAddItem4(context);
                },
              ),
              SizedBox(height: 7),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items4.length,
                  itemBuilder: (context, index) {
                    final item = items4[index];
                    return CustomCard(
                      imagePath: item['image']!,
                      title: item['title']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
