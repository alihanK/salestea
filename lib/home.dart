import 'package:flutter/material.dart';

import 'ShopPage.dart';
import 'buttomnavbarcustom.dart';
import 'cart.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedindex = 0;
  //navigate bottombar
  void navigateBottomNavBar(int newIndex) {
    setState(() {
      _selectedindex = newIndex;
    });
  }

  final List<Widget> _pages = [
    //Shop Page
    const shopPage(),
    //Cart Page
    const Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      bottomNavigationBar: bottomNavbar(
        onTabChange: (index) => navigateBottomNavBar(index),
      ),
      body: _pages[_selectedindex],
    );
  }
}
