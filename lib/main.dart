import 'package:flutter/material.dart';

import './screens/tabs.dart';
import './screens/recipe_detail.dart';
import './screens/recipes.dart';
import './screens/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        canvasColor: const Color.fromRGBO(255, 255, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Colors.lightGreen),
              bodyText2: const TextStyle(color: Colors.black),
              headline3: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        RecipesScreen.routeName: (ctx) => RecipesScreen(),
        RecipeDetailScreen.routeName: (ctx) => RecipeDetailScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
