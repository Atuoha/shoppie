import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: const Text('ddddd'),
      ),
    );
  }
}
