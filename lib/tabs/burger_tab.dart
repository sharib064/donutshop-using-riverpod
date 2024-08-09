import 'package:donutapp/models/cart_provider.dart';
import 'package:donutapp/models/donut_provider.dart';
import 'package:donutapp/utils/donut_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BurgerTab extends ConsumerWidget {
  const BurgerTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List burgerOnSale = ref.read(burgerProvider);
    return GridView.builder(
      itemCount: burgerOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemBuilder: (context, index) {
        final burger = burgerOnSale[index];
        return DonutTile(
          donutColor: burger.donutColor,
          donutName: burger.donutName,
          donutPrice: burger.donutPrice,
          imageName: burger.imagePath,
          onTap: () {
            ref.read(cartNotifierProvider.notifier).addDonut(burger);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: burger.donutColor[300],
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
