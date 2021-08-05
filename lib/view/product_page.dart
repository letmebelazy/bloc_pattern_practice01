import 'package:bloc_example/models/product.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  static String routeName = '/product';

  @override
  Widget build(BuildContext context) {
    final dynamic product = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        title: Text('Product details'),
      ),
      body: Center(
        child: Container(
          child: Text(
            '${product.name}',
            style: TextStyle(fontSize: 34),
          ),
        ),
      ),
    );
  }
}
