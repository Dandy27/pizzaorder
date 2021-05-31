import 'package:flutter/material.dart';
import 'package:pizzaorder/components/ingredient.dart';

const _pizzaCartSize = 55.0;

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

class _PizzaDetails extends StatefulWidget {
  @override
  __PizzaDetailsState createState() => __PizzaDetailsState();
}

class __PizzaDetailsState extends State<_PizzaDetails> {
  final _listIngredients = <Ingredient>[];
  bool _focused = false;
  int _total = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DragTarget<Ingredient>(
            onAccept: (ingredient) {
              // ignore: avoid_print
              print('onAccept');
              setState(() {
                _focused = false;
              });
            },
            onWillAccept: (ingredient) {
              // ignore: avoid_print
              print('onWillAccept');
              setState(() {
                _focused = true;
                _total++;
              });

              for (final Ingredient i in _listIngredients) {
                if (i.compare(ingredient!)) {
                  return false;
                }
              }

              return true;
            },
            onLeave: (ingredient) {
              // ignore: avoid_print
              print('onLeave');
              setState(() {
                _focused = false;
              });
            },
            builder: (context, list, rejects) {
              return LayoutBuilder(builder: (context, constraints) {
                return Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: _focused
                        ? constraints.maxHeight
                        : constraints.maxHeight - 10,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/dish.png'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/images/pizza-1.png'),
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
            // ! TODO TRANSITION
          },
          child: Text(
            '\$$_total',
            key: Key(_total.toString()),
            style: const TextStyle(fontSize: 26),
          ),
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
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = ingredients[index];
          return PizzaIngredientsItem(ingredient: ingredient);
        });
  }
}

class PizzaIngredientsItem extends StatelessWidget {
  final Ingredient ingredient;

  const PizzaIngredientsItem({Key? key, required this.ingredient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final child = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        height: 45,
        width: 45,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: const Color(0xFFF5EED3),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset(
            ingredient.image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
    return Center(
      child: Draggable(
        feedback: child,
        data: ingredient,
        child: child,
      ),
    );
  }
}
