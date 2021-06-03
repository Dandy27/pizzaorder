import 'package:flutter/material.dart';

import 'common/components/build_app_bar.dart';
import 'common/components/build_body.dart';

class PizzaOrderHome extends StatefulWidget {
  const PizzaOrderHome({Key? key}) : super(key: key);

  @override
  _PizzaOrderHomeState createState() => _PizzaOrderHomeState();
}

class _PizzaOrderHomeState extends State<PizzaOrderHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildBody(context));
  }
}
