import 'package:donutapp/models/cart_provider.dart';
import 'package:donutapp/models/donut_provider.dart';
import 'package:donutapp/utils/donut_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PizzaTab extends ConsumerWidget {
  const PizzaTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List pizzaOnSale = ref.read(pizzaProvider);
    return GridView.builder(
      itemCount: pizzaOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemBuilder: (context, index) {
        final pizza = pizzaOnSale[index];
        return DonutTile(
          donutColor: pizza.donutColor,
          donutName: pizza.donutName,
          donutPrice: pizza.donutPrice,
          imageName: pizza.imagePath,
          onTap: () {
            ref.read(cartNotifierProvider.notifier).addDonut(pizza);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: pizza.donutColor[300],
                title: const Text(
                  "Item added to cart succesfully",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Ok",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
