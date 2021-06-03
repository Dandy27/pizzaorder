import 'package:flutter/material.dart';

class AnimatedContainerTest extends StatefulWidget {
  @override
  _AnimatedContainerTestState createState() => _AnimatedContainerTestState();
}

class _AnimatedContainerTestState extends State<AnimatedContainerTest> {
  var _color = Colors.red;
  var _height = 100.0;
  var _width = 100.0;

  void animatedContainer() {
   setState(() {
      _color = _color == Colors.red ? Colors.green : Colors.red;
    _height = _height == 100 ? 200 : 100;
    _width = _width == 100 ? 200 : 100;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOutBack,
              color: _color,
              height: _height,
              width: _width,
            ),
            OutlinedButton(
                onPressed: () {
                  animatedContainer();
                },
                child: const Text('Aniamted'))
          ],
        ),
      ),
    );
  }
}
