import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).colorScheme.inversePrimary)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 80),
        padding: const EdgeInsets.symmetric(vertical: 10),
        
        child: Center(
          child: Text(text),),
      ),
    );
  }
}