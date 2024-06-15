import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
      name: "Mark 1",
      price: "2000",
      imagePath: "lib/images/1.png",
      description: "Red Beast",
    ),
    Shoe(
      name: "Mark 2",
      price: "1000",
      imagePath: "lib/images/2.jpg",
      description: "Feel The Colors",
    ),
    Shoe(
      name: "Mark 3",
      price: "3000",
      imagePath: "lib/images/3.jpg",
      description: "Maximize Your Run",
    ),
    Shoe(
      name: "Mark 4",
      price: "5000",
      imagePath: "lib/images/4.jpg",
      description: "Freshness In The Air",
    ),
  ];

  List<Shoe> cartItem = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getCartList() {
    return cartItem;
  }

  void addItemToCart(Shoe shoe) {
    cartItem.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    cartItem.remove(shoe);
    notifyListeners();
  }
}
