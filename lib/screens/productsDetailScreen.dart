// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:bech_daal/providers/product.dart';

// class ProductDetailScreen extends StatelessWidget {
//   const ProductDetailScreen({super.key, required this.id});
//   final String id;

//   @override
//   Widget build(BuildContext context) {
//     final productId = id;
//     final dataRoom = Provider.of<Products>(context);
//     final product = dataRoom.findById(productId);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.title),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 300,
//             width: double.infinity,
//             child: Hero(
//               tag: product.id,
//               child: Image.network(
//                 // wrap two images with same hero
//                 product.imageUrl, // and unme ek me ontap hona chahiye,
//                 fit: BoxFit.cover,
//                 alignment: Alignment.topCenter,
//               ),
//             ),
//           ),
//           Card(
//             child: SizedBox(
//               width: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       const Text(
//                         "Price",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       Chip(
//                         label: Text(
//                           "\$${product.price}",
//                           style: const TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                       )
//                     ]),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 product.description,
//                 style: const TextStyle(
//                   fontSize: 17,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bech_daal/providers/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<Products>(
          builder: (context, products, _) {
            final product = products.findById(id);
            return Text(product.title);
          },
        ),
      ),
      body: Consumer<Products>(
        builder: (context, products, _) {
          final product = products.findById(id);
          return Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Card(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Price",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Chip(
                          label: Text(
                            "\$${product.price}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
