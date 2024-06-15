import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/shoe.dart';

import 'components/shoe_tile.dart';
import 'models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Successfully added"),
              content: Text("Check your cart"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, chile) => Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "everyone flies.. some fly longer than others",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hot Pics 🔥",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "see more",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.getShoeList().length,
              itemBuilder: (BuildContext context, int index) {
                Shoe shoe = value.getShoeList()[index];
                return Row(
                  children: [
                    ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    ),
                  ],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 15,
              left: 25,
              right: 25,
            ),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
