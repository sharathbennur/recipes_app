import 'package:flutter/material.dart';
import '../data/dummy_recipes.dart';

class RecipesScreen extends StatelessWidget {
  static const routeName = '/categories';
  // final String categoryId;
  // final String categoryTitle;

  // RecipesScreen({this.categoryId = '', this.categoryTitle = ''});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryRecipes = dummyRecipes.where((recipe) {
      return recipe.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text("$categoryTitle Recipes"),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(
              categoryRecipes[index].title,
              style: TextStyle(color: Colors.black),
            );
          },
          itemCount: categoryRecipes.length,
        ));
  }
}
