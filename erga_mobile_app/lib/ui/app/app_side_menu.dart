import 'package:flutter/material.dart';

class AppSideMenu extends StatelessWidget {
  const AppSideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          IconButton(
            icon: const Icon(Icons.inbox),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.people_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.star_border),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
