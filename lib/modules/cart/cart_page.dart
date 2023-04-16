import 'package:flutter/material.dart';
import 'package:shop_app/config/theme.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/item_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState =
        Provider.of<CartModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
          centerTitle: true,
          backgroundColor: MyCustomTheme.appBarColor,
        ),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30.0,
              child: Center(
                child: Text('Total ${cartState.total()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 15,
                    )),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ItemCart(
                  title: cartState.items[index].title,
                  money: cartState.items[index].price,
                  dateCreated: DateTime.now(),
                  deleteFunction: (ctx) {
                    cartState.removeCart(index);
                  },
                );
              },
              childCount: cartState.items.length,
            ),
          )
        ]));
  }
}
