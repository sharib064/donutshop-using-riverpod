import 'package:donutapp/models/cart_provider.dart';
import 'package:donutapp/models/donut_provider.dart';
import 'package:donutapp/utils/donut_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PancakeTab extends ConsumerWidget {
  const PancakeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List panCakeOnSale = ref.read(pancakeProvider);
    return GridView.builder(
      itemCount: panCakeOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemBuilder: (context, index) {
        final pancake = panCakeOnSale[index];
        return DonutTile(
          donutColor: pancake.donutColor,
          donutName: pancake.donutName,
          donutPrice: pancake.donutPrice,
          imageName: pancake.imagePath,
          onTap: () {
            ref.read(cartNotifierProvider.notifier).addDonut(pancake);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: pancake.donutColor[300],
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
