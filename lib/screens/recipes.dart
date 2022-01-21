import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  RecipesScreen({this.categoryId = '', this.categoryTitle = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle Recipes"),
      ),
      body: Center(
        child: Text(
          "Recipes for $categoryTitle",
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
