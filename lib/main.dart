// ignore_for_file: prefer_const_constructors
import 'package:bech_daal/LandingPage.dart';
import 'package:bech_daal/providers/cart.dart';
import 'package:bech_daal/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final int x = 5;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        )

        // jis bhi provider class ka obj bnana ho uska provider yaha main me lkhna hota h, in this app we made object of prduct and cart
        //   // obj bnaya taki uske func call kr ka listener would work
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: LandingPage(x: x),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
