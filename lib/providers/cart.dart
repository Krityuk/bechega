import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {}; // this map would be empty initially

  // get items is a sp type of func: it is getter func, iska yahi syntax hota h
  Map<String, CartItem> get items {
    return {..._items};
  } //here get items func is just returning a copy of _items

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total = total + cartItem.price * cartItem.quantity;
    });
    return total;
  }

//************************************************************************************************** */

  void addItem(String id, double price, String title) {
    if (_items.containsKey(id)) {
      // if the item is already in cart,then just
      _items.update(
          // incr its quantity by one
          id,
          (existing) => CartItem(
                id: existing.id, //_items.update is inbuilt func of map
                price: existing.price, // _items.containsKey(id) &
                quantity: existing.quantity + 1, //_items.putIfAbsent bhi
                title: existing.title, // inbuilt func of map
              ));
      print("$title is added to cart again");
    } else {
      _items.putIfAbsent(
          // if item is not in cart then add
          id, // it into the cart
          () => CartItem(
                id: DateTime.now().toString(),
                price: price,
                quantity: 1,
                title: title,
              ));
      print("$title is added to cart");
    }
    notifyListeners();
  }

//************************************************************************************************** */

  void removeItem(String id) {
    _items.remove(id); // map.remove() is inbuilt func for maps
    notifyListeners();
  }
}
