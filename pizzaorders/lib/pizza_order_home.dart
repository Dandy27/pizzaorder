import 'package:flutter/material.dart';
import 'package:pizzaorder/constants.dart';

import 'common/components/app_bar.dart';
import 'common/components/build_cart_button.dart';
import 'common/components/build_pizza_detail.dart';
import 'common/components/build_pizza_ingredientes.dart';

class PizzaOrderHome extends StatefulWidget {
  @override
  _PizzaOrderHomeState createState() => _PizzaOrderHomeState();
}

class _PizzaOrderHomeState extends State<PizzaOrderHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Positioned.fill(
              bottom: 50,
              left: defaultPadding / 2,
              right: defaultPadding / 2,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: defaultPadding / 2,
                  child: Column(children: [
                    buildPizzzaDetail(),
                    buildPizzaIngredients()
                  ]))),
          buildCardButton(context)
        ],
      ),
    );
  }
}
