import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;       //this is item shown in first page of app
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavourite = false,
  });

  void toggleFavorite() {
    isFavourite = !isFavourite;
    // print("this item is favorite - $isFavourite");
    notifyListeners();
  }
}
