import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../main.dart';


  AppBar buildAppBar() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: defaultPadding / 2),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart_outlined, size: 27,),
              color: Colors.brown,),
        )
      ],
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        MyApp.title,
        style: TextStyle(color: Colors.brown, fontSize: 27),
      ),
      centerTitle: true,
    );
  }