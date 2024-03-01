import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salestea/drinktile.dart';
import 'package:salestea/models/shop.dart';

import 'models/drink.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _cartState();
}

class _cartState extends State<Cart> {
  //remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<teaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<teaShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(children: [
                  //heading
                  const Text(
                    'CART',
                    style: TextStyle(fontSize: 25),
                  ),
                  //list of cart items
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.cart.length,
                          itemBuilder: (context, index) {
                            //get individual cart first
                            Drink drink = value.cart[index];

                            //return as a tile
                            return drinkTile(
                              drink: drink,
                              onTap: () => removeFromCart(drink),
                              trailing: Icon(Icons.delete),
                            );
                          })),

                  //pay button
                  MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.black,
                    onPressed: () {},
                    child:
                        Text('PAY NOW', style: TextStyle(color: Colors.white)),
                  ),
                ]),
              ),
            ));
  }
}
