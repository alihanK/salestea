// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  bottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.white,
        color: Colors.grey[300],
        tabActiveBorder: Border.all(color: Colors.white),
        gap: 5,
        tabs: [
          //shop bar
          GButton(
            icon: Icons.home,
            text: 'SHOP',
          ),
          //cart bar
          GButton(
            icon: Icons.shopping_bag,
            text: 'CART',
          ),
        ],
      ),
    );
  }
}
