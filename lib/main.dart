import 'package:flutter/material.dart';
import 'package:recipes_app/data/dummy_recipes.dart';

import './screens/tabs.dart';
import './screens/recipe_detail.dart';
import './screens/recipes.dart';
import './screens/categories.dart';
import './screens/filters.dart';
import './models/recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Recipe> _availableMeals = dummyRecipes;
  List<Recipe> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyRecipes.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          dummyRecipes.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
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
        initialRoute: '/', // default is '/'
        routes: {
          '/': (ctx) => TabsScreen(_favoriteMeals),
          RecipesScreen.routeName: (ctx) => RecipesScreen(_availableMeals),
          RecipeDetailScreen.routeName: (ctx) =>
              RecipeDetailScreen(_toggleFavorite, _isMealFavorite),
          FiltersScreen.routeName: (ctx) =>
              FiltersScreen(_filters, _setFilters),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => CategoriesScreen());
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => CategoriesScreen(),
          );
        });
  }
}
