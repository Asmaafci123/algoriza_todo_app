import 'package:flutter/material.dart';
import 'package:to_do/Bussiness_Layer/cubit.dart';

class DropDownButtonField extends StatefulWidget {
  final List<String> items;
  String? value;
  DropDownButtonField({Key? key, required this.items, this.value})
      : super(key: key);

  @override
  State<DropDownButtonField> createState() => _DropDownButtonFieldState();
}

class _DropDownButtonFieldState extends State<DropDownButtonField> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 16.0),
          hintText: 'Please select expense',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.value,
          isDense: true,
          onChanged: (newValue) {
            if (widget.items == AppCubit.get(context).reminderList) {
              setState(() {
                AppCubit.get(context).reminderTime = newValue!;
                widget.value = AppCubit.get(context).reminderTime;
              });
            } else {
              setState(() {
                AppCubit.get(context).repeatTime = newValue!;
                widget.value = AppCubit.get(context).repeatTime;
              });
            }
          },
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
