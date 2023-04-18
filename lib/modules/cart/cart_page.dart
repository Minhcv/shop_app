import 'package:flutter/material.dart';
import 'package:shop_app/config/theme.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/item_model.dart';
import 'package:shop_app/widgets/item_cart.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
          centerTitle: true,
          backgroundColor: MyCustomTheme.appBarColor,
        ),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 3),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      'Total:',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    Container(
                        width: 80,
                        height: 30,
                        margin: const EdgeInsets.only(left: 90.0),
                        decoration: BoxDecoration(
                          color: MyCustomTheme.appBarColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            '${cartState.total()} \$',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/order');
                          },
                          child: Text(
                            'Order now',
                            style: GoogleFonts.roboto(
                              color: MyCustomTheme.textColorPink,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ))
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                List<Item> list = cartState.itemsSet().toList();
                return ItemCart(
                  id: list[index].id,
                  title: list[index].title,
                  money: list[index].price,
                  dateCreated: DateTime.now(),
                  deleteFunction: (ctx) {
                    cartState.removeCart(list[index].id);
                  },
                );
              },
              childCount: cartState.itemsSet().length,
            ),
          )
        ]));
  }
}
