import 'package:flutter/material.dart';

import '../screens/recipe_detail.dart';
import '../models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Cost cost;

  RecipeItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.cost,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.Expensive:
        return 'Expensive';
      case Cost.Inexpensive:
        return 'Inexpensive';
      case Cost.Regular:
        return 'Reguar';
      default:
        return 'Unknown';
    }
  }

  void selectRecipe(context) {
    Navigator.of(context).pushNamed(
      RecipeDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectRecipe(context),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(
                        imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        width: 300,
                        color: Colors.black26,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(children: <Widget>[
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('${duration} min'),
                      ]),
                      Row(children: <Widget>[
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(complexityText),
                      ]),
                      Row(children: <Widget>[
                        const Icon(Icons.monetization_on),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(costText),
                      ]),
                    ],
                  ),
                )
              ],
            )));
  }
}
