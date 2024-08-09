import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutName;
  final String donutPrice;
  final donutColor;
  final String imageName;
  final void Function()? onTap;
  const DonutTile(
      {super.key,
      required this.donutColor,
      required this.donutName,
      required this.donutPrice,
      required this.imageName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: donutColor[100], borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: donutColor[300],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                  ),
                  child: Text(
                    '\$$donutPrice',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
              child: Image.asset(imageName),
            ),
            Text(
              donutName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Dunkins",
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.pink[400],
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Icon(
                      Icons.add,
                      color: Colors.grey[800],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
