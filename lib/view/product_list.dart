import 'package:bloc_example/bloc/cart_bloc.dart';
import 'package:bloc_example/bloc/cart_state.dart';
import 'package:bloc_example/view/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(listener: (context, state) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state is ProductAdded ? 'Added to cart.' : 'Removed from cart.'),
        duration: Duration(milliseconds: 100),
      ));
    }, builder: (_, cartState) {
      List<int> cart = cartState.cartItem;
      return LayoutBuilder(builder: (context, constraints) {
        return GridView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => ProductTile(itemNo: index, cart: cart),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth > 700 ? 4 : 1, childAspectRatio: 5),
        );
      });
    });
  }
}

// @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
//       List<int> cart = cartState.cartItem;
//       return LayoutBuilder(builder: (context, constraints) {
//         return GridView.builder(
//           itemCount: 100,
//           itemBuilder: (context, index) => ProductTile(itemNo: index, cart: cart),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: constraints.maxWidth > 700 ? 4 : 1, childAspectRatio: 5),
//         );
//       });
//     });
//   }