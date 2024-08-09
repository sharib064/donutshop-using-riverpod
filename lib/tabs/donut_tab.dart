import 'package:donutapp/models/cart_provider.dart';
import 'package:donutapp/utils/donut_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:donutapp/models/donut_provider.dart';

class DonutTab extends ConsumerWidget {
  const DonutTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List donutOnSale = ref.watch(donutProvider);
    return GridView.builder(
      itemCount: donutOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemBuilder: (context, index) {
        final donut = donutOnSale[index];

        return DonutTile(
          donutColor: donut.donutColor,
          donutName: donut.donutName,
          donutPrice: donut.donutPrice,
          imageName: donut.imagePath,
          onTap: () {
            ref.read(cartNotifierProvider.notifier).addDonut(donut);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: donut.donutColor[300],
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
