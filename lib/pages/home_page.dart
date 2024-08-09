import 'package:donutapp/pages/cart_page.dart';
import 'package:donutapp/tabs/burger_tab.dart';
import 'package:donutapp/tabs/donut_tab.dart';
import 'package:donutapp/tabs/pancake_tab.dart';
import 'package:donutapp/tabs/pizza_tab.dart';
import 'package:donutapp/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png'),
    const MyTab(iconPath: 'lib/icons/pancakes.png'),
    const MyTab(iconPath: 'lib/icons/burger.png'),
    //const MyTab(iconPath: 'lib/icons/smoothei.png'),
    const MyTab(iconPath: 'lib/icons/pizza.png')
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ));
                },
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: Column(
          children: [
            // const SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   child: Row(
            //     children: [
            //       Text(
            //         "I want to eat ",
            //         style: TextStyle(color: Colors.grey[600], fontSize: 16),
            //       ),
            //       const Text(
            //         "EAT",
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            //       )
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            TabBar(
              tabs: myTabs,
              indicatorColor: Colors.pink,
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  PancakeTab(),
                  BurgerTab(),
                  //Smoothei(),
                  PizzaTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
