import 'package:donutapp/models/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final userCart = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: userCart.isEmpty
                ? const Center(
                    child: Text("Empty Cart"),
                  )
                : ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      final cartItem = userCart[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListTile(
                          tileColor: cartItem.donutColor[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          leading: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(cartItem.imagePath),
                          ),
                          title: Text(
                            cartItem.donutName,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            '\$${cartItem.donutPrice}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                              onPressed: () => ref
                                  .read(cartNotifierProvider.notifier)
                                  .removeDonut(cartItem),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              )),
                        ),
                      );
                    },
                  ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  "Pay now",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
