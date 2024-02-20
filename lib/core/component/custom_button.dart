import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String? text;
  final Function onPressed;
  const CustomButton({super.key, this.text, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => widget.onPressed(),
        style: ElevatedButton.styleFrom(
          side: const BorderSide(width: 1),
          backgroundColor: Colors.amber,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(widget.text ?? ''),
        ));
  }
}
