import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/modules/cart/cart_page.dart';
import 'package:shop_app/modules/detail/detail_page.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/modules/order/order_page.dart';

import 'modules/home/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: <String, WidgetBuilder>{
      '/': (context) => const HomePage(),
      '/detail': (context) => const DetailPage(),
      '/cart': (context) => const CartPage(),
      '/order': (context) => const OrderPage(),
    });
  }
}
