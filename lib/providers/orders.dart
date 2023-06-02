import 'package:flutter/material.dart';
import 'package:bech_daal/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> orderedProducts;
  final DateTime datetime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.orderedProducts,
    required this.datetime,
  });
}

class Oders with ChangeNotifier {
  List<OrderItem> _orders = [];   // 
                                //  ye dono lines are written always together
  List<OrderItem> get orders {    //
    return [..._orders];
  }

  void addOder(List<CartItem> cartProducts, double total) {
    _orders.add(OrderItem(
      amount: total,    // map.add 
      datetime: DateTime.now(),
      id: DateTime.now().toString(),   // arraylist.add is inbuilt func
      orderedProducts: cartProducts,
    ));

    notifyListeners();
  }

  void clearAll() {
    _orders = [];
    notifyListeners();
  }
}
