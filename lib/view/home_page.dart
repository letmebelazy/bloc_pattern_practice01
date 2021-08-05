import 'package:bloc_example/bloc/cart_bloc.dart';
import 'package:bloc_example/bloc/cart_state.dart';
import 'package:bloc_example/view/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';
  // final double _crossAxisSpacing = 8, _aspectRatio = 5;
  // final int _crossAxisCount = 1;

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // var width = (screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
    // var height = width / _aspectRatio;

    return BlocProvider(
      create: (_) => CartBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shopping App'),
          actions: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart),
                    label: Text(''),
                    key: Key('cart'),
                  ),
                ),
                BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
                  List<int> cartItem = cartState.cartItem;
                  return Positioned(
                      left: 30,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), color: Colors.red),
                        child: Text(
                          '${cartItem.length}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ));
                })
              ],
            )
          ],
        ),
        body: ProductList(),
      ),
    );
  }
}
