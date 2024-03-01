// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salestea/models/shop.dart';

import 'drinktile.dart';
import 'models/drink.dart';
import 'order_page.dart';

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  //user selected a drink, order page navigation
  void goToOrderPage(Drink drink) {
    //Navigate to ORDER page
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderPage(
                  drink: drink,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<teaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              //heading
              Text(
                'TEA SALES APP',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              //list of drinks for sale
              Expanded(
                child: ListView.builder(
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      //get individual drink from shop
                      Drink individualDrink = value.shop[index];
                      //return get drink as a tile
                      return drinkTile(
                        drink: individualDrink,
                        onTap: () => goToOrderPage(individualDrink),
                        trailing: Icon(Icons.arrow_forward_rounded),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
