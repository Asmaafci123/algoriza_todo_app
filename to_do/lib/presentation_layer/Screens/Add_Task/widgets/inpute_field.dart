import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final IconData? suffixIcon;
  final VoidCallback? onPressedSuffix;
  final TextEditingController controller;
  const InputField(
      {Key? key,
      this.onPressedSuffix,
      required this.hintText,
      this.suffixIcon,
      required this.controller})
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: widget.suffixIcon != null ? true : false,
        controller: widget.controller,
        style: const TextStyle(color: Colors.grey),
        onTap: widget.onPressedSuffix,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                widget.suffixIcon,
              )),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ));
  }
}
