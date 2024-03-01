import 'package:flutter/material.dart';

import 'drink.dart';

class teaShop extends ChangeNotifier {
  //list of drink for sale
  final List<Drink> _shop = [
    //first tea
    Drink(
        name: "roseship tea",
        price: "5 dollars",
        imagePath: 'images/rosehiptea.png'),
    Drink(name: "hot tea", price: "3 dollars", imagePath: 'images/hottea.png'),
    Drink(
        name: "green tea (megasize)",
        price: "10 dollars",
        imagePath: 'images/greenteamegasize.png'),
    Drink(
        name: "green tea",
        price: "2 dollars",
        imagePath: 'images/greentea.png'),
    Drink(
        name: "classic tea",
        price: "3 dollars",
        imagePath: 'images/teacup.png'),
  ];

  //list of drinks in user cart
  final List<Drink> _userCart = [];

  //get drinks for sale
  List<Drink> get shop => _shop;

  //get user cart
  List<Drink> get cart => _userCart;

  //add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  //remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
