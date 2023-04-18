import 'package:flutter/material.dart';
import 'package:shop_app/config/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:intl/intl.dart';

import '../../models/item_model.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your order'),
          centerTitle: true,
          backgroundColor: MyCustomTheme.appBarColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 70, // Đặt chiều cao cho DrawerHeader
                decoration: const BoxDecoration(
                  color: MyCustomTheme.appBarColor, // Màu nền của DrawerHeader
                ),
                child: const DrawerHeader(
                  child: Text('Hello friend!'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.shop),
                title: const Text('Shop'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_card),
                title: const Text('Order'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/cart');
                },
              ),
            ],
          ),
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
                    Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${cartState.total()} \$',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                    DateFormat('dd/MM/yyyy')
                                        .format(DateTime.now()),
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ))
                              ],
                            ),
                          ],
                        ))
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                List<Item> list = cartState.itemsSet().toList();
                return ListTile(
                  title: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 150),
                        child: Text(list[index].title),
                      ),
                      Text(
                          '${cartState.itemAmount(list[index].id)}x ${list[index].price} \$'),
                    ],
                  ),
                );
              },
              childCount: cartState.itemsSet().length,
            ),
          )
        ]));
  }
}
