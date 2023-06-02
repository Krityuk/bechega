// ignore_for_file: sort_child_properties_last

import 'package:bech_daal/providers/cart.dart';
import 'package:bech_daal/screens/placeOrdersScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);//provider.of method is alternative of cosnumer<product> method
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Chip(
                      label: Text("${cart.totalAmount}"),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: FittedBox(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "${cart.items.values.toList()[index].price}"),
                        )),
                      ),
                      title: Text("${cart.items.values.toList()[index].title}"),
                      subtitle: Text(
                          "Total: ${cart.items.values.toList()[index].price * cart.items.values.toList()[index].quantity}"),
                      trailing: Text(
                          "${cart.items.values.toList()[index].quantity} x"),
                    ),
                  ),
                  key: ValueKey(cart.items.keys.toList()[index]),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    cart.removeItem(cart.items.keys.toList()[index]);
                  },
                  background: Container(
                    padding: const EdgeInsets.only(right: 20),
                    color: Theme.of(context).errorColor,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                );
              },
              itemCount: cart.itemCount,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            child: ElevatedButton(
              // color: Theme.of(context).accentColor,
              child: const Text(
                "ORDER NOW",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlaceOrderScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
