import 'package:donutapp/models/donut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Donut> donutOnSale = [
  Donut(
      donutName: "Ice Cream",
      donutPrice: "36",
      donutColor: Colors.blue,
      imagePath: 'lib/images/donut2.png'),
  Donut(
      donutName: "Strawberry",
      donutPrice: "45",
      donutColor: Colors.red,
      imagePath: 'lib/images/donut3.png'),
  Donut(
      donutName: "Grape Ape",
      donutPrice: "49",
      donutColor: Colors.purple,
      imagePath: 'lib/images/donut4.png'),
  Donut(
      donutName: "Choco",
      donutPrice: "42",
      donutColor: Colors.brown,
      imagePath: 'lib/images/donut1.png'),
];

List<Donut> burgerOnSale = [
  Donut(
      donutName: "Beef burger",
      donutPrice: "36",
      donutColor: Colors.blue,
      imagePath: 'lib/images/burger1.png'),
  Donut(
      donutName: "Cheeseburger",
      donutPrice: "45",
      donutColor: Colors.red,
      imagePath: 'lib/images/burger2.png'),
  Donut(
      donutName: "Chicken Burger",
      donutPrice: "49",
      donutColor: Colors.purple,
      imagePath: 'lib/images/burger3.png'),
  Donut(
      donutName: "BBQ burger",
      donutPrice: "42",
      donutColor: Colors.brown,
      imagePath: 'lib/images/burger4.png'),
];
List<Donut> panCakeOnSale = [
  Donut(
      donutName: "Keto pancakes",
      donutPrice: "36",
      donutColor: Colors.blue,
      imagePath: 'lib/images/pancake1.png'),
  Donut(
      donutName: "Banana flavor",
      donutPrice: "45",
      donutColor: Colors.red,
      imagePath: 'lib/images/pancake2.png'),
  Donut(
      donutName: "Oat pancakes",
      donutPrice: "49",
      donutColor: Colors.purple,
      imagePath: 'lib/images/pancake3.png'),
  Donut(
      donutName: "Oreo pancakes",
      donutPrice: "42",
      donutColor: Colors.brown,
      imagePath: 'lib/images/pancake4.png'),
];
List<Donut> pizzaOnSale = [
  Donut(
      donutName: "Fried Pizza",
      donutPrice: "36",
      donutColor: Colors.blue,
      imagePath: 'lib/images/pizza1.png'),
  Donut(
      donutName: "Pepperoni Pizza",
      donutPrice: "45",
      donutColor: Colors.red,
      imagePath: 'lib/images/pizza2.png'),
  Donut(
      donutName: "BBQ Pizza",
      donutPrice: "49",
      donutColor: Colors.purple,
      imagePath: 'lib/images/pizza3.png'),
  Donut(
      donutName: "Veggie Pizza",
      donutPrice: "42",
      donutColor: Colors.brown,
      imagePath: 'lib/images/pizza4.png'),
];
final pizzaProvider = Provider(
  (ref) => pizzaOnSale,
);
final pancakeProvider = Provider(
  (ref) => panCakeOnSale,
);
final burgerProvider = Provider(
  (ref) => burgerOnSale,
);
final donutProvider = Provider(
  (ref) {
    return donutOnSale;
  },
);
