import 'package:flutter/material.dart';
import 'package:pizzaorder/components/ingredient.dart';

import '../../constants.dart';

Widget buildPizzzaDetail() {
  return Expanded(
    flex: 3,
    child: Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 800),
        
          child: Expanded(
            child: DragTarget<Ingredient>(
              onWillAccept: (ingredient) => true,
              onAccept: (iingredient) {},
              builder: (BuildContext context, List<Object?> candidateData,
                  List<dynamic> rejectedData) {
                return Stack(
                  children: [
                    Image.asset(
                      'assets/images/dish.png',
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        'assets/images/pizza-1.png',
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        buildText(valor: '\$15')
      ],
    ),
  );
}

Widget buildText({
  required String valor,
}) {
  return Text(
    valor,
    style: const TextStyle(
        color: Colors.brown, fontSize: 28, fontWeight: FontWeight.bold),
  );
}
