import 'package:flutter/material.dart';

class TabBarItems extends StatelessWidget {
  final String item;

  const TabBarItems({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          item,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  final String title;

  const DrawerItems({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
