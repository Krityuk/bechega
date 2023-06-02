import 'package:bech_daal/providers/product.dart';
import 'package:bech_daal/widgets/Listtile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);// Products is the api
    final productList = productData.items; // productList is list of all items of thast api

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //axis-count
        childAspectRatio: 3 / 2,//size of tile
        crossAxisSpacing: 10,//spacing
        mainAxisSpacing: 10,//spacing
      ),
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        debugPrint(
            "index is $index ${productList[index].title} isFavoriteStatus: ${productList[index].isFavourite}");
        return ChangeNotifierProvider.value(
          value: productList[index],
          child: const ProductTile(),
        );
      },
    );
  }
}
