import 'package:flutter/material.dart';
import 'package:shop_app/models/item_model.dart';

import '../../config/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        centerTitle: true,
        backgroundColor: MyCustomTheme.appBarColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item.imageUrl, // URL hình ảnh sản phẩm
              height: 200, // Chiều cao của hình ảnh
              fit: BoxFit.cover, // Kiểu hiển thị hình ảnh
            ),
            const SizedBox(height: 16),
            Text(
              'Product Name: ${item.title}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: ${item.price}', // Giá sản phẩm
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 16),
            Text(
              'Description: ${item.description}', // Mô tả sản phẩm
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
