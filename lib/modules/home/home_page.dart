import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/config/theme.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/item_model.dart';
import 'package:shop_app/widgets/product.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> itemList = []; // Danh sách dữ liệu

  Future<void> fetchData() async {
    String url =
        'https://my-json-server.typicode.com/thanpd/flutter-data/product';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        itemList = jsonResponse.map((json) => Item.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  initState() {
    super.initState();
    fetchData();
  }

  _vote(String id) {
    setState(() {
      Item item = itemList.firstWhere((obj) => obj.id == id);
      item.isLike = !item.isLike;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Shop'),
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
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.75,
          ),
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Product(
              item: itemList[index],
              onAddToCartPressed: () => {cartState.addCart(itemList[index])},
              onLikePressed: () => {_vote(itemList[index].id)},
            );
          },
        ));
  }
}
