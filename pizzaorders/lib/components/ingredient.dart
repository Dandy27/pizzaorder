class Ingredient {
  late final String image;
  Ingredient(
    this.image,
  );

  bool compare(Ingredient ingredient) => ingredient.image == image;
}

final ingredients = <Ingredient>[
  Ingredient('assets/images/chili.png'),
  Ingredient('assets/images/garlic.png'),
  Ingredient('assets/images/olive.png'),
  Ingredient('assets/images/onion.png'),
  Ingredient('assets/images/pea.png'),
  Ingredient('assets/images/pickle.png'),
  Ingredient('assets/images/potato.png'),
];
