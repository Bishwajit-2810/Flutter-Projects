import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/cart_item.dart';
import 'models/cart.dart';
import 'models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const Text(
              "My Cart",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.getCartList().length,
                itemBuilder: (BuildContext context, int index) {
                  Shoe shoe = value.getCartList()[index];
                  return CartItem(
                    shoe: shoe,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
