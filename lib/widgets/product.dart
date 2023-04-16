import 'package:flutter/material.dart';
import 'package:shop_app/models/item_model.dart';

class Product extends StatelessWidget {
  final Item item;
  final VoidCallback onLikePressed;
  final VoidCallback onAddToCartPressed;

  const Product(
      {super.key,
      required this.item,
      required this.onLikePressed,
      required this.onAddToCartPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: item);
            },
            child: SizedBox(
              height: 100,
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  item.price.toString(),
                  style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: onLikePressed,
                      icon: const Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: onAddToCartPressed,
                      icon: const Icon(Icons.shopping_cart),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
