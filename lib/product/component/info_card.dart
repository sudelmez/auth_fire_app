import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  String? text;
  Color? color;
  Size? size;
  bool? isDelete;
  Function()? onTap;
  InfoCard({super.key, this.text, this.isDelete, this.size, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: size?.width,
      decoration: BoxDecoration(color: color ?? Colors.amber, borderRadius: BorderRadius.circular(20), border: Border.all()),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(text ?? ''), isDelete ?? false ? IconButton(onPressed: onTap, icon: const Icon(Icons.delete, color: Colors.cyan)) : const SizedBox()]),
    );
  }
}
