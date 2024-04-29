
import 'package:flutter/material.dart';
import 'package:ecommerce/model/cartItem.dart'; 

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(CartItem item) {
    _items.add(item);
    notifyListeners(); 
  }
}
