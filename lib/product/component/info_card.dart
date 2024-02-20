import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  String? text;
  Color? color;
  Size? size;
  InfoCard({super.key, this.text, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: size?.width,
      decoration: BoxDecoration(color: color ?? Colors.amber, borderRadius: BorderRadius.circular(20), border: Border.all()),
      child: Center(child: Text(text ?? '')),
    );
  }
}
