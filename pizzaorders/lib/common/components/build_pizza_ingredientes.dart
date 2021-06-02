import 'package:flutter/material.dart';
import 'package:pizzaorder/components/ingredient.dart';

import '../../constants.dart';


  Widget buildPizzaIngredients() {
    return Expanded(
        flex: 2,
        child: ListView.builder(
            itemCount: ingredients.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 2.5),
                child: buildPizzaItem(ingredient),
              );
            }));
  }

  Widget buildPizzaItem(Ingredient ingredient) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFFF5EED3),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          ingredient.image,
        ),
      ),
    );
  }