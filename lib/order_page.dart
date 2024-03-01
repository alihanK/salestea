import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/drink.dart';
import 'models/shop.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //for sweet customize
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  //for ice customize
  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  //for pearl customize
  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  //add to cart
  void addToCart() {
    //firstly add to cart
    Provider.of<teaShop>(context, listen: false).addToCart(widget.drink);
    //direct user back to shop page
    Navigator.pop(context);
    //let user know it has been succesfully added
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text('Succesfully added to cart!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text(widget.drink.name),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            //drink image
            Image.asset(widget.drink.imagePath),

            //sliders to customize drinks
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  //sweetness slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100, child: Text('sweet quantity')),
                      Expanded(
                        child: Slider(
                          value: sweetValue,
                          label: sweetValue.toString(),
                          divisions: 5,
                          onChanged: (value) => customizeSweet(value),
                        ),
                      ),
                    ],
                  ),
                  //ice slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                          width: 100, child: Text('ice      quantity')),
                      Expanded(
                        child: Slider(
                          value: iceValue,
                          label: iceValue.toString(),
                          divisions: 5,
                          onChanged: (value) => customizeIce(value),
                        ),
                      ),
                    ],
                  ),
                  //pearls slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                          width: 100, child: Text('pearls quantity')),
                      Expanded(
                        child: Slider(
                          value: pearlValue,
                          label: pearlValue.toString(),
                          divisions: 5,
                          onChanged: (value) => customizePearl(value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //add to cart button
            MaterialButton(
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                color: Colors.white,
                onPressed: addToCart),
          ],
        ));
  }
}
