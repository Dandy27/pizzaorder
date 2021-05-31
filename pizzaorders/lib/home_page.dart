import 'package:flutter/material.dart';
import 'package:pizzaorder/components/ingredient.dart';

const _pizzaCartSize = 48.0;

class PizzaOrderDetails extends StatefulWidget {
  @override
  _PizzaOrderDetailsState createState() => _PizzaOrderDetailsState();
}

class _PizzaOrderDetailsState extends State<PizzaOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.brown,
              ))
        ],
        title: const Text(
          'Vegan Pizza',
          style: TextStyle(
            color: Colors.brown,
            fontSize: 24,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 50,
            left: 10,
            right: 10,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Expanded(flex: 3, child: _PizzaDetails()),
                  Expanded(flex: 2, child: _PizzaIngredients())
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            height: _pizzaCartSize,
            width: _pizzaCartSize,
            left: MediaQuery.of(context).size.width / 2 - _pizzaCartSize / 2,
            child: _PizzaCartButton(),
          ),
        ],
      ),
    );
  }
}

class _PizzaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DragTarget<Ingredient>(
            onAccept: (ingredient) {
              print('onAccept');
            },
            onWillAccept: (ingredient) {
              print('onWillAccept');
              return true;
            },
            onLeave: (ingredient) {
              print('onLeave');
            },
            builder: (context, list, rejects) {
              return Stack(
                children: [
                  Image.asset('assets/images/dish.png'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/images/pizza-1.png'),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          '\$27',
          style: TextStyle(fontSize: 26),
        )
      ],
    );
  }
}

class _PizzaCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orange.withOpacity(0.5),
                  Colors.orange,
                ])),
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
          size: 35,
        ));
  }
}

class _PizzaIngredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.5),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ingredients.length,
          itemBuilder: (context, index) {
            final ingredient = ingredients[index];
            return PizzaIngredientsItem(ingredient: ingredient);
          }),
    );
  }
}

class PizzaIngredientsItem extends StatelessWidget {
  final Ingredient ingredient;

  const PizzaIngredientsItem({Key? key, required this.ingredient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final child = Container(
      height: _pizzaCartSize,
      width: _pizzaCartSize,
      decoration:
          const BoxDecoration(color: Color(0xFFF5EED3), shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          ingredient.image,
          fit: BoxFit.contain,
        ),
      ),
    );
    return Draggable(
      feedback: child,
      data: ingredient,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: child,
      ),
    );
  }
}
