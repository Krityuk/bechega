// ignore_for_file: sort_child_properties_last

import 'package:bech_daal/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bech_daal/models/product.dart';
import 'package:bech_daal/screens/productsDetailScreen.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override // YE HAR TILE WIDGET KA CODE H,
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    //ye context is = that specific productItem ,so Provider.of<Product>(context) is returning that productItem
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(id: product.id)));
        },
        child: GridTile(
          child: Hero(
            tag: product.id,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                  product.isFavourite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                //toggle here
                // product.toggleFavorite();
                product.isFavourite = !product.isFavourite;
                product.notifyListeners();
              },
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
            ),
          ),
        ),
      ),
    );
  }
}
