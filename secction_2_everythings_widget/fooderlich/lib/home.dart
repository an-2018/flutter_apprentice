import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    Container(color: Colors.red,),
    Container(color: Colors.green,),
    Container(color: Colors.blue,),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Style the title
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      // TODO: Style the body text
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Card"),
          const BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Card2"),
          const BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Card3"),
      ],),
    );
  }
}
