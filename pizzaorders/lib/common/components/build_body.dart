import 'package:flutter/material.dart';

import '../../constants.dart';

const _pizzaCardSize = 50.0;

Widget buildBody(BuildContext context) {
  return Stack(
    children: [
      Positioned.fill(
        bottom: 50,
        left: 10,
        right: 10,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Column(
            children: [
              buildPizzaDetails(),
              Expanded(
                  flex: 2,
                  child: Container(
                      // color: Colors.red,
                      )),
            ],
          ),
        ),
      ),
      buildButtonCart(context)
    ],
  );
}

Widget buildButtonCart(BuildContext context) {
  final IconData icon;
  return Positioned(
      bottom: 35,
      height: _pizzaCardSize,
      width: _pizzaCardSize,
      left: MediaQuery.of(context).size.width / 2 - _pizzaCardSize / 2,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.orange.withOpacity(0.5),
              Colors.orange,
            ],
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            size: 35,
            color: Colors.white,
          ),
        ),
      ));
}

Widget buildPizzaDetails() => Expanded(
    flex: 3,
    child: Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/dish.png',
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset('assets/images/pizza-1.png'),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        buildText()
      ],
    ));

Widget buildText() {
  return const Text(
    '\$15',
    style: TextStyle(
        color: Colors.brown, fontSize: 28, fontWeight: FontWeight.bold),
  );
}
