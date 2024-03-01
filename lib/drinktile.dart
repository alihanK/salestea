// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

import 'models/drink.dart';

class drinkTile extends StatelessWidget {
  final Drink drink;
  final Widget trailing;
  void Function()? onTap;
  drinkTile(
      {super.key,
      required this.drink,
      required this.onTap,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent[100],
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
            title: Text(drink.name),
            subtitle: Text(drink.price),
            leading: Image.asset(drink.imagePath),
            trailing: trailing),
      ),
    );
  }
}
