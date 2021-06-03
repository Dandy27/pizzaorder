import 'package:flutter/material.dart';

import '../../constants.dart';

AppBar buildAppBar({required String text, required VoidCallback press}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: defaultPadding / 2),
        child: IconButton(
          onPressed: press,
          icon: const Icon(
            Icons.add_shopping_cart_outlined,
            size: 27,
          ),
          color: Colors.brown,
        ),
      )
    ],
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text(
      text,
      style: const TextStyle(color: Colors.brown, fontSize: 27),
    ),
    centerTitle: true,
  );
}
