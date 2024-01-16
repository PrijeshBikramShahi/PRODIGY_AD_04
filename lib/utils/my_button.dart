import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  VoidCallback onTap;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.redAccent.withOpacity(
        0.2,
      ),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            size: 40,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
