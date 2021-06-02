import 'package:flutter/material.dart';

import '../../main.dart';


  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        MyApp.title,
        style: TextStyle(color: Colors.brown, fontSize: 28),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.brown,
                size: 30,
              )),
        )
      ],
    );
  }

