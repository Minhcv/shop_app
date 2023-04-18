import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/config/theme.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart_model.dart';

class ItemCart extends StatelessWidget {
  final String id;
  final String title;
  final double money;
  final DateTime dateCreated;
  final Function(BuildContext)? deleteFunction;

  const ItemCart(
      {super.key,
      required this.id,
      required this.title,
      required this.money,
      required this.dateCreated,
      this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartModel>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(4),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
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
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 20.0),
                  decoration: BoxDecoration(
                    color: MyCustomTheme.appBarColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '${cartState.sumPriceById(id)} \$',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  )),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Total: ${cartState.sumPriceById(id)} \$',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'x${cartState.itemAmount(id)}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
