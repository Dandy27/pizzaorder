import 'package:flutter/material.dart';


  Widget buildCardButton(BuildContext context) {
    const pizzaCartSize = 50.0;
    return Positioned(
        bottom: 40,
        height: pizzaCartSize,
        width: pizzaCartSize,
        left: MediaQuery.of(context).size.width / 2 - pizzaCartSize / 2,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.orange.withOpacity(0.2), Colors.orange])),
          child:  InkWell(
            child: IconButton(icon: const Icon(Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 35,), onPressed: () {  },
              
            ),
          ),
        ));
  }

