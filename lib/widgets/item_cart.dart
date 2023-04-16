import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/config/theme.dart';

class ItemCart extends StatelessWidget {
  final String title;
  final double money;
  final DateTime dateCreated;
  final Function(BuildContext)? deleteFunction;

  const ItemCart(
      {super.key,
      required this.title,
      required this.money,
      required this.dateCreated,
      this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 218, 166, 200),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 20.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 117, 109),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '$money',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  )),
              Column(
                children: [
                  Text(
                    'Chi phí: $title',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm').format(dateCreated),
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
