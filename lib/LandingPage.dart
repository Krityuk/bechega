// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bech_daal/providers/cart.dart';
import 'package:bech_daal/providers/product.dart';
import 'package:bech_daal/screens/cartScreen.dart';
import 'package:bech_daal/widgets/badge.dart';
import 'package:bech_daal/widgets/drawer.dart';
import 'package:bech_daal/widgets/productsGrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  // const LandingPage({super.key, required this.x});
  // const LandingPage({Key? key, required this.x}) : super(key: key);
  // these both are lines are same, but 2nd one is more appropriate way
  const LandingPage({Key? key, required this.x}) : super(key: key);
  final int x;

  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context);
    final cart = Provider.of<Cart>(context);
    // The Provider.of method is an alternative way to consume a provider without using the Consumer

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bech Daal App'),
        centerTitle: true,
        actions: [
          Badge(
            //just wrap the widget into this if want to do with consumer method Consumer<Cart>(
            // builder: (context, cart, widget?child) => Badge()
            color: Colors.white,
            value: cart.itemCount.toString(),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ));
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (_popupValue) {
              if (_popupValue == PopupValue.showFavourite) {
                productContainer.showFavorite();
              } else {
                productContainer.showAll();
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: PopupValue.showFavourite,
                child: Text("Only Favorite"),
              ),
              const PopupMenuItem(
                value: PopupValue.showAll,
                child: Text("Show All"),
              ),
            ],
          ),
        ],
      ),
      body: const ProductsGrid(),
      drawer: const DrawerMenu(),
    );
  }
}

enum PopupValue { showFavourite, showAll }




                      //   USING CONSUMER METHOD THE CODE IS THIS
 

//  import 'package:bech_daal/providers/cart.dart';
// import 'package:bech_daal/providers/product.dart';
// import 'package:bech_daal/screens/cartScreen.dart';
// import 'package:bech_daal/widgets/badge.dart';
// import 'package:bech_daal/widgets/drawer.dart';
// import 'package:bech_daal/widgets/productsGrid.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LandingPage extends StatelessWidget {
//   const LandingPage({Key? key, required this.x}) : super(key: key);
//   final int x;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Bech Daal App'),
//         centerTitle: true,
//         actions: [
//           Consumer<Cart>(
//             builder: (context, cart, widget?child) => Badge(
//               color: Colors.white,
//               value: cart.itemCount.toString(),
//               child: IconButton(
//                 icon: const Icon(Icons.shopping_cart),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const CartScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Consumer<Products>(
//             builder: (context, productContainer, child) => PopupMenuButton(
//               onSelected: (_popupValue) {
//                 if (_popupValue == PopupValue.showFavourite) {
//                   productContainer.showFavorite();
//                 } else {
//                   productContainer.showAll();
//                 }
//               },
//               icon: const Icon(Icons.more_vert),
//               itemBuilder: (child) => [
//                 const PopupMenuItem(
//                   value: PopupValue.showFavourite,
//                   child: Text("Only Favorite"),
//                 ),
//                 const PopupMenuItem(
//                   value: PopupValue.showAll,
//                   child: Text("Show All"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: const ProductsGrid(),
//       drawer: const DrawerMenu(),
//     );
//   }
// }

// enum PopupValue { showFavourite, showAll }
