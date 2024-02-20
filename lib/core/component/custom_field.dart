import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final TextInputType type;

  const CustomField({Key? key, this.controller, this.hint, this.type = TextInputType.text}) : super(key: key);

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        keyboardType: widget.type,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: widget.hint,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.amber,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.amber,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
