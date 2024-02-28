import 'package:flutter/material.dart';
import 'package:store/screens/home_page.dart';
import 'package:store/screens/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id:(context) =>HomePage(),
        UpdateProductPage.id:(context) => UpdateProductPage(),

      },
      initialRoute: HomePage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}