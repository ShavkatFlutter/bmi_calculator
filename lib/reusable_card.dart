import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {

  ReusableContainer({required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
