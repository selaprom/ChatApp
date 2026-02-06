import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  const MyButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Center(child: Text(label)),
      ),
    );
  }
}
